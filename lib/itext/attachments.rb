# encoding: utf-8
module Itext::Attachments

  def initialize(*args, &block)
    @hooks     ||= []
    @hooks.push ->{ process_attachments }
  end

  def self.included(base)
    base.extend(ClassMethods)
    attr_reader :attachments

    # base.class_eval do    
    #   original_method = instance_method(:initialize)
    #   define_method(:initialize) do |*args, &block|
    #     original_method.bind(self).call(*args, &block)
    #     @hooks.push ->{ process_attachments }
    #   end
    # end
  end

  def add_attachments(attachments)
    @attachments ||= []
    attachments = [attachments] unless attachments.is_a?(Array)
    attachments.each do |attachment|
      if File.exists?(attachment)
        @attachments << attachment
      end
    end
    @attachments
  end

  alias :add_attachment :add_attachments

  def remove_attachments(attachments)
    @attachments ||= []
    attachments = [attachments] unless attachments.is_a?(Array)
    attachments.each do |attachment|
      if File.exists?(attachment)
        @attachments.delete(attachment)
      end
    end
    @attachments
  end

  alias :remove_attachment :remove_attachments

  def process_attachments
    @writer   = @stamper.getWriter.to_java(Java::ComLowagieTextPdf::PdfWriter)

    @attachments.each do |attachment_path|
      attachment_name = Pathname.new(attachment_path).basename.to_s.to_java_string
      attachment_spec = Java::ComLowagieTextPdf::PdfFileSpecification.fileEmbedded @writer, 
                                                                                   attachment_path.to_java_string,
                                                                                   attachment_name,
                                                                                   nil
      attachment_spec.addDescription attachment_name, false.to_java(:boolean)
      @stamper.addFileAttachment attachment_name, attachment_spec
    end

    # @writer.close
  end

  protected :process_attachments

  module ClassMethods

  end

end