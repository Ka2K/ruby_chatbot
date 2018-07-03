class KakaoController < ApplicationController
  def keyboard
    @keyboard = {
      :type => "buttons",
      :buttons => ["메뉴", "로또번호추천", "고양이"] 
    }
    
    render json: @keyboard
    
  end
  
  def message
    @user_msg = params[:content]
    @text = "기본응답"
    
    if @user_msg == "메뉴"
      @text = ["20층", "멀캠식당", "급식"].sample
    elsif @user_msg == "로또번호추천" 
      # @text = "#{(1..45).to_a.sample(6).sort}"
      @text = (1..45).to_a.sample(6).sort.to_s
    elsif @user_msg == "고양이"
      @url = "http://thecatapi.com/api/images/get?format=xml&type=jpg"
      @cat_xml = RestClient.get(@url)
      @cat_doc = Nokogiri::XML(@cat_xml)
      @cat_url = @cat_doc.xpath("//url").text
      @text = @cat_url
    end
    
    @return_msg = {
      :text => @text 
    }
    
    @return_msg_photo = {
      :text => "냥냥이 키우고 싶다ㅠ",
      :photo => {
        :url => @cat_url,
        :width => 720,
        :height => 630 
      }
    }
    
    @return_keyboard = {
      :type => "buttons",
      :buttons => ["메뉴", "로또번호추천", "고양이"] 
    }
    
    if @user_msg == "고양이"
      @result = {
        :message => @return_msg_photo,
        :keyboard => @return_keyboard
      }
    else
      @result = {
        :message => @return_msg,
        :keyboard => @return_keyboard
      }
    end
    
    render json: @result
    
  end
end