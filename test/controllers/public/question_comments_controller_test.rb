require "test_helper"

class Public::QuestionCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_question_comments_index_url
    assert_response :success
  end
end
