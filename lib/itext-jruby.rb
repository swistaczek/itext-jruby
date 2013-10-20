# encoding: utf-8
require 'java'

class Itext

  # Import all required jars and packages
  def self.import_java(notify = false)
    Dir[File.expand_path(File.join(File.dirname(__FILE__), "../libexec/jar/*.jar"))].each { |jar| require jar }

    libs = [
      java.io.ByteArrayOutputStream,
      com.lowagie.text.html.WebColors,
      com.lowagie.text.Document,
      com.lowagie.text.Paragraph,
      com.lowagie.text.Phrase,
      com.lowagie.text.PageSize,
      com.lowagie.text.Chunk,
      com.lowagie.text.pdf.PdfPCell,
      com.lowagie.text.pdf.PdfPTable,
      com.lowagie.text.BadElementException,
      com.lowagie.text.DocumentException,
      com.lowagie.text.Image,
      com.lowagie.text.pdf.PdfFileSpecification,
      com.lowagie.text.pdf.PdfReader,
      com.lowagie.text.pdf.PdfSignatureAppearance,
      com.lowagie.text.pdf.PdfStamper,
      com.lowagie.text.pdf.PdfWriter,
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