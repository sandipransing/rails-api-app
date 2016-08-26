class Swagger::Docs::Config
  def self.transform_path(path, version)
    "api/#{path}"
  end

  def self.base_api_controller
    ActionController::API
  end
end
Swagger::Docs::Config.register_apis({
  "1.0": {
    # the extension used for the API
    api_extension_type: :json,
    # the output location where your .json files are written to
    api_file_path: "public/api/",
    # the URL base path to your API
    base_path: "/",
    # if you want to delete all .json files at each generation
    clean_directory: false,
    attributes: {
      info: {
        title: "Rails API App Documentation",
        description: "This rails api app is a quick guide to get started with rails 5 api only app with JWT token authentication integration.",
        termsOfService: "http://swagger.io/terms/",
        contact: "sandip.ransing@synerzip.com",
        license: {
          name: "Apache 2.0",
          url: "http://www.apache.org/licenses/LICENSE-2.0.html"
        }
      }
    }
  }
})
