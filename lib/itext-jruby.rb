# encoding: utf-8
require 'java'
Dir[File.expand_path(File.join(File.dirname(__FILE__), "../libexec/jar/*.jar"))].each { |jar| require jar }

java_import java.io.ByteArrayOutputStream
java_import com.lowagie.text.html.WebColors
java_import com.lowagie.text.Document
java_import com.lowagie.text.Paragraph
java_import com.lowagie.text.Phrase
java_import com.lowagie.text.PageSize
java_import com.lowagie.text.Chunk
java_import com.lowagie.text.pdf.PdfPCell
java_import com.lowagie.text.pdf.PdfPTable
java_import com.lowagie.text.BadElementException
java_import com.lowagie.text.DocumentException
java_import com.lowagie.text.Image
java_import com.lowagie.text.pdf.PdfFileSpecification
java_import com.lowagie.text.pdf.PdfReader
java_import com.lowagie.text.pdf.PdfSignatureAppearance
java_import com.lowagie.text.pdf.PdfStamper
java_import com.lowagie.text.pdf.PdfWriter
java_import java.io.FileOutputStream

require 'itext'