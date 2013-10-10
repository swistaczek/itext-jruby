# encoding: utf-8
# This module will allow you signing PDF document with certificate
module Itext::Signing

  require 'java'
  java_import 'java.security.KeyStore'
  java_import 'java.security.KeyStoreException'
  java_import 'java.security.NoSuchAlgorithmException'
  java_import 'java.security.NoSuchProviderException'
  java_import 'java.security.PrivateKey'
  java_import 'java.security.UnrecoverableKeyException'
  java_import 'java.security.cert.Certificate'
  java_import 'java.security.cert.CertificateException'

  # Add processing hook
  def initialize(*args, &block)
    @hooks     ||= []
    @hooks.push ->{ process_signing }

    super rescue nil
  end

  # Hook with some initalization
  def self.included(base)
    base.extend(ClassMethods)

    attr_reader :private_key_path
    attr_reader :password
  end

  # Enable document signing
  # Required options: { private_key_path: '/path/key' }
  # Optional options: { password: '' }
  def enable_signing!(opts = {})
    raise ArgumentError, "Please provide :private_key_path"            unless opts[:private_key_path]
    raise ArgumentError, "Specified :private_key_path does not exists" unless File.exists?(opts[:private_key_path])

    @private_key_path = opts[:private_key_path]
    @password         = opts[:password].to_s.to_java.toCharArray

    @keystore = Java::JavaSecurity::KeyStore.getInstance('pkcs12')
    @keystore.load(Java::JavaIo::FileInputStream.new(@private_key_path), @password)

    keystore_alias = @keystore.aliases().nextElement()
    @private_key   = @keystore.getKey(keystore_alias, @password).to_java(Java::JavaSecurity::PrivateKey)
    @cert_chain    = @keystore.getCertificateChain(keystore_alias)
  end

  # Check if signing file should be done
  def sign_file?
    @private_key_path && File.exists?(@private_key_path)
  end

  # Change default behavior of stamper if using signing
  def initialize_stamper
    Java::ComLowagieTextPdf::PdfStamper.createSignature(@reader, @buffer, 0x00.to_java(Java::JavaLang::Character)) if sign_file?
  end

  # Process signing using IText
  def process_signing
    if sign_file?
      @appearance    = @stamper.getSignatureAppearance().to_java(Java::ComLowagieTextPdf::PdfSignatureAppearance)
      @appearance.setCrypto(@private_key, @cert_chain, nil, Java::ComLowagieTextPdf::PdfSignatureAppearance::WINCER_SIGNED)
    end
  end

  protected :process_signing

  module ClassMethods

  end

end