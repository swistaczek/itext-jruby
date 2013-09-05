# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "itext-jruby"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ernest Bursa"]
  s.date = "2013-09-05"
  s.description = "IText"
  s.email = "ernest@bzdury.pl"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "itext-jruby.gemspec",
    "lib/itext-jruby.rb",
    "lib/itext.rb",
    "lib/itext/attachments.rb",
    "libexec/jar/bcmail-jdk14-138.jar",
    "libexec/jar/bcprov-jdk14-138.jar",
    "libexec/jar/bctsp-jdk14-138.jar",
    "libexec/jar/crimson.jar",
    "libexec/jar/dom4j-1.6.1.jar",
    "libexec/jar/iText-rtf.jar",
    "libexec/jar/iText-rups.jar",
    "libexec/jar/iText.jar",
    "libexec/jar/iTextAsian.jar",
    "libexec/jar/iTextAsianCmaps.jar",
    "libexec/jar/itext-hyph-xml.jar",
    "libexec/jar/jcommon.jar",
    "libexec/jar/jfreechart.jar",
    "libexec/jar/junit-4.4.jar",
    "libexec/jar/pdf-renderer.jar",
    "libexec/jar/servlet.jar",
    "test/helper.rb",
    "test/test_itext-jruby.rb"
  ]
  s.homepage = "http://github.com/swistaczek/itext-jruby"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "jRuby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

