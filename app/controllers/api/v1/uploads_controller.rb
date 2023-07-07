class Api::V1::UploadsController < ApiController
    before_action :current_resource_owner

    def index
        @uploads = @user.uploads
    end

    def create
        # Call the external API and get the response
        @upload = @user.uploads.build(upload_param)

        respond_to do |format|
            if @upload.save
              response = call_external_api(params[:content])
        
              format.json { render json: response, status: :created }
            else
              format.json { render json: @upload.errors, status: :unprocessable_entity }
            end
        end
    end
  
    private
  
    def call_external_api(content)
        # Implement the logic to call the external API
        # You can use any HTTP client library such as `Net::HTTP`, `HTTParty`, or `Faraday`
        # Here's an example using `HTTParty`:
        
        url = 'https://api.example.com/endpoint'
        headers = { 'Content-Type': 'multipart/form-data' }
        payload = { content: content }
        
        #response = HTTParty.post(url, headers: headers, body: payload)
        
        # Return the parsed JSON response
        #JSON.parse(response.body)
        response = '{"result":"Hello World"}'
        JSON.parse(response)
    end

    def current_resource_owner
        @user = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end

    def upload_param
        params.permit(:content)
    end
  end