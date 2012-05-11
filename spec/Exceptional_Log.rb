
describe "Exceptional_Log.convert file_path" do
  
  before { 
    @files = Dir.glob("./spec/file/thin*.log")
    @e = @files.map { |f|
      Exceptional_Log.convert(f)
    }
  }

  it "returns an Enumerable" do
    @e.should.respond_to :each_index 
  end
  
  it "turns each log into a Exceptional_Log" do
    @e.each { |e| e.should.is_a Exceptional_Log }
  end

  it "sets exception class to file basename: thin_A.log -> Thin_A" do
    @files.each_index { |i|
      @e[i].class.name
      .should == File.basename(@files[i]).sub('.log', '').split("_").map(&:capitalize).join('_')
    }
  end

  it "sets key :message to file path" do
    File.file?( @e.first.message )
    .should == true
  end

  it "sets key :backtrace as Array of lines from file" do
    @e.last[:backtrace]
    .should == Split_Lines( File.read(@files.last) )
  end

  it "sets key :created_at to :atime of file" do
    @e.last[:created_at]
    .should == File.stat(@files.last).atime
  end
  
end # === Exceptional_Log ruby_glob


describe "Exceptional#to_hash" do
  
  before { 
    @e = Exceptional_Log.convert(Dir.glob('spec/file/thin*').first)
    @h = @e.to_hash
  }
  
  %w{ exception message backtrace created_at }.each { |k|

    it "sets :#{k}" do
      @h[:"#{k}"].should == @e.send(k)
    end
    
  }


end # === Exceptional#to_hash

