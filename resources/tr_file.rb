# 'rb' stands for resource bowl
# 'tr' stands for translate
resource_name :rb_tr_file

property :source_file, String
property :search_regexp, String
property :string_to_be, String

action :translate do
  new_file_content = []
  ::File.readlines(new_resource.source_file).each do |line|
    if line =~ /#{new_resource.search_regexp}/
      new_file_content.append(
        line.gsub!(
          /#{new_resource.search_regexp}/,
          new_resource.string_to_be
        )
      )
    else
      new_file_content.append(line)
    end
  end

  ::File.open(new_resource.source_file, 'w') do |file|
    file.puts(new_file_content)
  end
end
