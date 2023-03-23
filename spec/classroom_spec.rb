require_relative './spec_helper'

describe Classroom do
  context 'test classroom specific methods' do
    before(:all) do
      @classroom = Classroom.new('A4')
      @student = Student.new(17, 'Rose')
    end

    it 'test classroom instance' do
      expect(@classroom).to be_instance_of Classroom
    end

    it 'test add student to classroom' do
      @classroom.add_student(@student)

      expect(@classroom.list_student.include?(@student)).to be true
    end
  end
end
