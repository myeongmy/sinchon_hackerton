class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  
  def search
    @foods = Food.solr_search do
      keywords params[:query1]
      keywords params[:query2]
    end.results
  
    if @foods[0] == nil
      @foods = Food.solr_search do
        keywords params[:query1]
      end.results  
      
      #1.두부김치
      @url = 'https://terms.naver.com/entry.nhn?docId=1286417&cid=40942&categoryId=32136'
      @page = RestClient.get(@url)
      @doc = Nokogiri::HTML(@page)
      @info = @doc.css('div.size_ct_v2 > p')
      
      c = Content.new
      c.content = @info
      c.save
      
      #2.치즈스틱
      @url = 'https://terms.naver.com/entry.nhn?docId=1524877&cid=48169&categoryId=48223'
      @page = RestClient.get(@url)
      @doc = Nokogiri::HTML(@page)
      @info = @doc.css('p.txt')
      
      c = Content.new
      c.content = @info
      c.save
      
      #3.돼지갈비구이
      @url = 'https://terms.naver.com/entry.nhn?docId=1084776&cid=40942&categoryId=32136'
      @page = RestClient.get(@url)
      @doc = Nokogiri::HTML(@page)
      @info = @doc.css('p.txt')
      
      c = Content.new
      c.content = @info
      c.save
      
      #4.계란말이
      @url = 'https://terms.naver.com/entry.nhn?docId=3543696&cid=40942&categoryId=32136'
      @page = RestClient.get(@url)
      @doc = Nokogiri::HTML(@page)
      @info = @doc.css('p.txt')
      
      c = Content.new
      c.content = @info
      c.save
      
      #5.타코야키
      @url = 'https://terms.naver.com/entry.nhn?docId=1225586&cid=40942&categoryId=32129'
      @page = RestClient.get(@url)
      @doc = Nokogiri::HTML(@page)
      @info = @doc.css('p.txt')
      
      c = Content.new
      c.content = @info
      c.save
      
      #6.제육볶음
      @url = 'https://terms.naver.com/entry.nhn?docId=1286421&cid=40942&categoryId=32136'
      @page = RestClient.get(@url)
      @doc = Nokogiri::HTML(@page)
      @info = @doc.css('p.txt')
      
      c = Content.new
      c.content = @info
      c.save
      
      #7.떡볶이
      @url = 'https://terms.naver.com/entry.nhn?docId=1086421&cid=40942&categoryId=32136'
      @page = RestClient.get(@url)
      @doc = Nokogiri::HTML(@page)
      @info = @doc.css('div.size_ct_v2 > p')
      
      c = Content.new
      c.content = @info
      c.save
      
      #8.돼지곱창구이
      @url = 'https://terms.naver.com/entry.nhn?docId=1988140&cid=48164&categoryId=48202'
      @page = RestClient.get(@url)
      @doc = Nokogiri::HTML(@page)
      @info = @doc.css('div.size_ct_v2 > p')
      
      c = Content.new
      c.content = @info
      c.save

      
    end
    
    respond_to do |format|
      format.html {render :action => "search"}
      format.xml {render :xml => @posts }
    end
  end
  
  def index
    @foods = Food.all
    @food_user_count={}
      @foods.each do |aa|
        count = M1.where(food_id:aa.id).count
        @food_user_count[aa.id]=count
      end
      #sort 해야함
      
      @food_user_count=@food_user_count.sort_by {|_key, value| value}.reverse.to_h
      @i=@food_user_count.keys()
      
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)
   

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  #다은
    
     def save_m1
       
       @all=M1.all
       @userposts=@all.where(user_id: current_user.id, food_id: params[:food_id])
       @check= @userposts
       if @check.length == 0
         @m1=M1.new
         @m1.food_id=params[:food_id]
         @m1.user_id=params[:user_id]
         @m1.save  
       end
         
       
       
      
      redirect_to :back
    end
    
    def postranking
      @foods = Food.all
      
        
    end
    
  
  
  def mypage
    
    @m1s=M1.where(user_id: current_user.id)
    @foods=[]
    @m1s.each do |t|
      @x=t.food_id
      @row=Food.find(@x)
      @foods.push(@row)
    end
    
   
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:fname, :material1, :material2, :image)
    end
    
    
    
    #def ranking
    #@users = User.all
    #@user_post_count={}
    #@user_email={}
   # @users.each do |aa|
    #  count = Post.where(user_id: aa.id).count
    #  @user_post_count[aa.id]=count
   #   @user_email[aa.id]=User.find(aa.id).email
      
   # end
   # @user_post_count=@user_post_count.sort_by {|_key, value| value}.reverse.to_h
  #  @x=@user_post_count.keys
  #end
  

    
    
end
