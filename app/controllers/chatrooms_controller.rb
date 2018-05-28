class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_chatroom, only: [:show, :edit, :update, :destroy]
  before_action :is_writer, only: [:edit, :update, :destroy]
  
  def index
    # 친그라운드에서는 자기가 참여한 곳에만 채팅 구현
    @my_chatrooms = current_user.chatrooms.reverse
  end

  def show
  end

  def new
    # create에 게시물 id를 넘기기 위함.
    @article = Article.find(params[:article_id])
  end

  # post '/article/article_id/chatroom/create'
  # 게시물 작성 시 자동으로 채팅방 생성되도록 만들어야함.
  def create
    @chatroom = Chatroom.create(name: params[:name], article_id: params[:article_id])
    # 생성하면서 게시물의 참여자들을 자동으로 참여시켜야함
    users_list = ArticleUser.where(article_id: params[:article_id].to_i)
    users_list.each do |articleuser|
      @chatroom.users << User.find(articleuser.user_id)
    end
    @chatroom.save
    redirect_to "/chatroom/index"
  end

  # [TODO] 수정 기능 추후 추가
  def edit
  end

  # [TODO] 업뎃 기능 추후 추가
  def update
    @chatroom.name = chatroom_params[:name]
    @chatroom.save
  end

  def destroy
    @chatroom.destroy
    redirect_back(fallback_location: "/article/show/#{@chatroom.article.id}")
  end

  def participate
  end

  def participate_cancel
  end
  
  private
  def find_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
  # 게시물 작성자만 채팅방 수정가능
  def is_writer
    if @chatroom.article.user_id != current_user.id
      flash[:error] = "게시물 작성자만 채팅방 수정 및 삭제가 가능합니다"
      redirect_back(fallback_location: root_path)
    end
  end
  
end
