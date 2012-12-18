class BookmarksController < ApplicationController
  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmark = Bookmark.all
    @template = <<EOF
		<script type="text/template" id="bookmark-template">
				<td>
					<input type="hidden" id="b_id" value=<%= id %> />
					<div class="site_name"><%= title %></div>
					<%= link %>
				</td>
				<td>
					<%= tag %>
				</td>
				<td>
					<%= username %>
				</td>
				<td class="remove">
					&otimes;
				</td>
		</script> 
EOF

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookmark }
    end
  end

  # GET /bookmarks/new
  # GET /bookmarks/new.json
  def new
    @bookmark = Bookmark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @bookmark }
    end
  end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(params[:bookmark])
#    req = ActiveSupport::JSON.decode(request.body)
#    @bookmark = Bookmark.new(req)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render json: @bookmark, status: :created, location: @bookmarks }
      else
        format.html { render action: "new" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bookmarks/1
  # PUT /bookmarks/1.json
  def update
    req = ActiveSupport::JSON.decode(request.body)
    @bookmark = Bookmark.find(req)

    respond_to do |format|
      if @bookmark.update_attributes(params[:id])
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { render json: @bookmark, status: :created, location: @bookmarks }
      else
        format.html { render action: "edit" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    respond_to do |format|
      format.html { }
      format.json { head :no_content }
    end
  end
end
