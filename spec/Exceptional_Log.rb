
describe "Exceptional_Log ruby_glob" do
  
  before { 
    @e = Exceptional_Log.glob("./spec/file/thin*.log") 
    @files = Dir.glob("./spec/file/thin*.log")
  }

  it "returns an Enumerable" do
    @e.each_index { |i|
      @e[i].should.is_a Exceptional_Log
    }
  end
  
  it "turns each log into a Exceptional_Log" do
    @e.each { |e| e.should.respond_to :[] }
  end

  it "sets key :exception to file basename" do
    File.file?( File.join("spec/file/" + @e.first[:exception] ) )
    .should.be == true
  end

  it "sets key :message to file dirname" do
    File.file?( File.join(@e.first[:message], @e.first[:exception] ) )
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

