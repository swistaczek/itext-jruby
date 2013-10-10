# encoding: utf-8
module Itext::Attachments

  def initialize(*args, &block)
    @hooks     ||= []
    @hooks.push ->{ process_attachments }

    super rescue nil
  end

  def self.included(base)
    base.extend(ClassMethods)
    attr_reader :attachments
  end

  def add_attachments(attachments)
    @attachments ||= []
    attachments = [attachments] unless attachments.is_a?(Array)
    attachments.each do |attachment|
      @attachments << attachment
    end
    @attachments
  end

  alias :add_attachment :add_attachments

  def remove_attachments(attachments)
    @attachments ||= []
    attachments = [attachments] unless attachments.is_a?(Array)
    attachments.each do |attachment|
      @attachments.delete(attachment)
    end
    @attachments
  end

  alias :remove_attachment :remove_attachments

  def process_attachments
    @writer   = @stamper.getWriter.to_java(Java::ComLowagieTextPdf::PdfWriter)

    if @attachments && @attachments.size > 0
      @attachments.each do |attachment|
        if attachment.is_a?(Hash)
          attachment_path = attachment[:path]
          attachment_name = attachment[:file_name]
        elsif attachment.is_a?(String)
          attachment_path = attachment.to_s
          attachment_name = Pathname.new(attachment_path).basename.to_s
        else
          raise ArgumentError.new("Specify hash with :path and :file_name or string with path")
        end

        attachment_spec = Java::ComLowagieTextPdf::PdfFileSpecification.fileEmbedded @writer, 
                                                                                     attachment_path.to_java_string,
                                                                                     attachment_name.to_java_string,
                                                                                     nil
        attachment_spec.addDescription attachment_name, false.to_java(:boolean)
        @stamper.addFileAttachment attachment_name, attachment_spec
      end
    end

    # @writer.close
  end

  protected :process_attachments

  module ClassMethods

  end

end