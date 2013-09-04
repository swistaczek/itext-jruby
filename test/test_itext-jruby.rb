# encoding: utf-8
require 'helper'

class TestItextJruby < Test::Unit::TestCase
  should "create pdf file" do
    @document = Java::ComLowagieText::Document.new(Java::ComLowagieText::PageSize::A4, 20, 20, 20, 20)
    @file     = Java::JavaIo::FileOutputStream.new "pdf_demo.pdf"

    para      = Java::ComLowagieText::Paragraph.new "Brought to you by JRuby using itext-jruby ext"

    table = Java::ComLowagieTextPdf::PdfPTable.new 3
    table.setWidthPercentage 100
    table.setHeaderRows 2
    table.setFooterRows 1

    cell = Java::ComLowagieTextPdf::PdfPCell.new Java::ComLowagieText::Phrase.new("Cell with colspan = 3")
    cell.setColspan 3
    cell.setBackgroundColor Java::ComLowagieTextHtml::WebColors.getRGBColor("#A00000")
    table.addCell cell

    (1..300).each do |i|
      cell = Java::ComLowagieTextPdf::PdfPCell.new Java::ComLowagieText::Phrase.new("Cell #{i}")
      cell.setBackgroundColor Java::ComLowagieTextHtml::WebColors.getRGBColor("#66c3dd")
      table.addCell cell
    end

    @writer = Java::ComLowagieTextPdf::PdfWriter.get_instance @document, @file

    @document.open
    @document.add para
    @document.add Java::ComLowagieText::Chunk::NEWLINE
    @document.add table
    @document.close
  end
end
