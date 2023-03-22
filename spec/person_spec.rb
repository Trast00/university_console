require_relative './spec_helper'

describe Person do
  context "test person basic method" do
    before(:each) do
      classroom = Classroom.new("A4")
      @student = Student.new(17, "rose Test", classroom, parent_permission: false)
      @teacher = Teacher.new(17, "doctor", "time travel")
    end
  
    it "test student and teacher are instance of person" do
      expect(@student).to be_kind_of Person
      expect(@teacher).to be_kind_of Person
    end

    it "test can_use_services" do
      expect(@student.can_use_services?).to be false
      expect(@teacher.can_use_services?).to be true
    end
  end

  context "test decorator" do
    before(:all) do
      @person = Person.new(15, "rose test123")
    end
    it "test capital decorator" do
      person = CapitalizeDecorator.new(@person)
      expect(person.correct_name).to eq("Rose test123")
    end
    it "test timmer decorator" do
      person = TrimmerDecorator.new(@person)
      expect(person.correct_name).to eq("rose test1")
    end
  end

  context "test student specifics methods" do
    before(:each) do 
      classroom = Classroom.new("A4")
      @student = Student.new(17, "rose Test", classroom, parent_permission: false)
    end

    it "test play honky" do
      expect(@student.play_hooky).to eq "¯(ツ)/¯"
    end

    it "test change classroom" do
      new_classroom = Classroom.new("new class")
      expect(@student.change_classroom(new_classroom).label).to eq "new class"
    end
  end

end