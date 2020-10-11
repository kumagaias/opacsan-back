module Csv
  def self.importBook
    CSV.foreach(file.path, headers: true, skip_blanks: true).with_index(2) do |row, line|
    end
  end
end
