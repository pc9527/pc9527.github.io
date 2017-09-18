
fl = Dir.glob("_posts/**/*.md")
fl.each{|fmd|
  puts "processing #{fmd}"
  fp = File.open fmd, "r"
  content = fp.readlines
  fp.close
  if content[0].nil?
    puts "WARN, no content for #{fmd}"
    next
  end # if content[0].nil?

  if content[0][0] == '-'
    next
  end
  title = content[0].gsub('# ', '')
  puts "title is #{title}"
  fpw = File.open fmd, "w"
  content.unshift "---\n"
  content.unshift "title: #{title}"
  content.unshift "---\n"

  content.each{|line|
    fpw.write line
  }
  fpw.close
}
