# encoding: utf-8
require 'pathname'

class Itext
  require 'itext/attachments'

  include Attachments

  # Create new Itext document instance
  # Required params:
  # path: Pass absolute path to pdf file
  def initialize(*args, &block)
    super

    opts   = args[0] if args.is_a?(Array)
    @path  = opts[:path]

    raise ArgumentError.new('Missing :path') if @path.nil?
    raise ArgumentError.new('Please provide absolute path') unless Pathname.new(@path).absolute?
  end

  def save(save_to = nil)
    save_to ||= @path

    output_file = if File.exists?(@path)
      Tempfile.new(['temp_pdf', '.pdf'])
    else
      File.open(save_to, "r+") 
    end

    @reader   = Java::ComLowagieTextPdf::PdfReader.new(@path.to_java(:string))
    @buffer   = Java::JavaIo::FileOutputStream.new output_file.path
    @stamper  = Java::ComLowagieTextPdf::PdfStamper.new @reader, @buffer

    # Run all attached hooks
    @hooks.each { |hook| hook.call }

    @stamper.close

    if output_file.is_a?(Tempfile)
      FileUtils.rm(save_to) if File.exists?(save_to)
      FileUtils.cp(output_file.path, save_to) 
    end
    
    # Return output path
    save_to
  end

  protected

  def hooks
    @hooks || []
  end

end