require "spec_helper"
	require 'pry'

describe "Student" do

  let(:josh) {Student.new("Josh", "9th")}
  	  before(:each) do
    DB[:conn].execute("DROP TABLE IF EXISTS students")
      sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS students (
 		        id INTEGER PRIMARY KEY,
    	        name TEXT,
	        grade TEXT
        )
    SQL
     		DB[:conn].execute(sql)
	  end
  		  describe "attributes" do
    it 'has a name and a grade' do
	      student = Student.new("Tiffany", "11th")
      expect(student.name).to eq("Tiffany")
	      expect(student.grade).to eq("11th")
    end
    it 'has an id that defaults to `nil` on initialization' do
      expect(josh.id).to eq(nil)
    end
end


	   describe ".create_table" do
it 'creates the students table in the database' do
	       Student.create_table
    table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='students';"
