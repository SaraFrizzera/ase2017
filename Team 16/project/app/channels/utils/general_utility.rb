# utility class only for general code
class GeneralUtility
  def require_all_files(exluded)
    Dir[File.join('.', '**/*.rb')].each do |f|
      require f unless f == "./#{exluded}.rb"
    end
  end
end
