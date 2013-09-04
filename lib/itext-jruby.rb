# encoding: utf-8
require 'java'
Dir[File.expand_path(File.join(File.dirname(__FILE__), "../libexec/jar/*.jar"))].each { |jar| require jar }

import java.io.ByteArrayOutputStream
import com.lowagie.text.html.WebColors
import com.lowagie.text.Document
import com.lowagie.text.Paragraph
import com.lowagie.text.Phrase
import com.lowagie.text.PageSize
import com.lowagie.text.Chunk
import com.lowagie.text.pdf.PdfPCell
import com.lowagie.text.pdf.PdfPTable
import com.lowagie.text.BadElementException
import com.lowagie.text.DocumentException
import com.lowagie.text.Image
import com.lowagie.text.pdf.PdfFileSpecification
import com.lowagie.text.pdf.PdfReader
import com.lowagie.text.pdf.PdfSignatureAppearance
import com.lowagie.text.pdf.PdfStamper
import com.lowagie.text.pdf.PdfWriter
import java.io.FileOutputStream

require 'itext'