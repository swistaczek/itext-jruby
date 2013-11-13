# encoding: utf-8
require 'java'

class Itext

  # Import all required jars and packages
  def self.import_java(notify = false)
    Dir[File.expand_path(File.join(File.dirname(__FILE__), "../libexec/jar/*.jar"))].each { |jar| require jar }

    libs = [
      java.io.ByteArrayOutputStream,
      com.itextpdf.text.html.WebColors,
      com.itextpdf.text.Document,
      com.itextpdf.text.Paragraph,
      com.itextpdf.text.Phrase,
      com.itextpdf.text.PageSize,
      com.itextpdf.text.Chunk,
      com.itextpdf.text.pdf.PdfPCell,
      com.itextpdf.text.pdf.PdfPTable,
      com.itextpdf.text.BadElementException,
      com.itextpdf.text.DocumentException,
      com.itextpdf.text.Image,
      com.itextpdf.text.pdf.PdfFileSpecification,
      com.itextpdf.text.pdf.PdfReader,
      com.itextpdf.text.pdf.PdfSignatureAppearance,
      com.itextpdf.text.pdf.PdfStamper,
      com.itextpdf.text.pdf.PdfWriter,
      com.itextpdf.text.pdf.security.PrivateKeySignature,
      com.itextpdf.text.pdf.security.BouncyCastleDigest,
      com.itextpdf.text.pdf.security.MakeSignature,
      java.io.FileOutputStream
    ]

    # Require lib only if package not found
    libs.each do |lib|
      unless defined?(lib)
        java_import(lib)
      else
        puts "Java Import: Allready defined: #{lib}" if notify
      end
    end
  end
end

require 'itext'