require 'test_helper'

class InfoPeliculaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get info_pelicula_index_url
    assert_response :success
  end

end
