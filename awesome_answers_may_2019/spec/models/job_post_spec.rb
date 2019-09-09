require 'rails_helper'
# To generate this file after you have already created
# the model, run:
# rails g rspec:model JobPost

# To run your tests with rspec, do:
# rspec
# To get detailed information about the running tests, do:
# rspec -f d
RSpec.describe JobPost, type: :model do

  def job_post
    @job_post ||= JobPost.new(
      title: "Awesome Job",
      description: "Some valid job description",
      min_salary: 1000
    )
  end

  # The "describe" is used to group related tests
  # together. It's primarily an organizational tool.
  # All of the grouped tests should be written within
  # the block of the method.
  describe "#validates" do
    # `it` is another RSpec keyword which is used to
    # define an "Example" (test case). The string argument
    # often uses the word "should" and is meant to
    # describe what specific behaviour should happen
    # inside the block.
    it("requires a title") do
      # Given
      # An instance of a JobPost
      jp = job_post
      jp.title = nil
      # When
      # Validations are triggered
      jp.valid?
      # Then
      # There's an error related to the title
      # in the error object.

      # The following will pass the test if the
      # errors.messages hash has a key named :title.
      # This only occurs when a "title" validation fails
      expect(jp.errors.messages).to(have_key(:title))
    end

    it "requires a unique title" do
      # Given
      # One job post in the db and an instance of
      # JobPost with the same title.
      persisted_jp = JobPost.create(title: "Imagination Engineer", description: "Be an Imagination WIZARD for us!!!! :) :) :)")
      jp = JobPost.new title: persisted_jp.title
      # When
      # Validations are triggered
      jp.valid?
      # Then
      # We get an error on the title
      expect(jp.errors.messages).to(have_key(:title))
      expect(jp.errors.messages[:title]).to(include("has already been taken"))
    end

    it("requires a description") do
      jp = JobPost.new

      jp.valid?

      expect(jp.errors.messages).to(have_key(:description))
    end
  end

  # As per Ruby docs, methods that are described with a
  # `.` in front are class methods, while those that are
  # described with a `#` in front are instance methods
  describe ".search" do

    it("should return all job posts containing a string") do
      # Given
      # 3 job posts in the db
      job_post_a = JobPost.create(
        title: "Software Engineer",
        description: "awesome job"
      )
      job_post_b = JobPost.create(
        title: "Programmer",
        description: "awesome job"
      )
      job_post_c = JobPost.create(
        title: "Web Developer",
        description: "Come be a software architect"
      )
      # When
      # searching for "software"
      result = JobPost.search("software")
      # Then
      # JobPost A and C are returned
      expect(result).to(eq([job_post_a, job_post_c]))
    end

  end
end
