class Repository
  attr_reader  :id,
               :name,
               :description,
               :language

  def initialize(params)
    @name = params["name"]
    @language = params["language"]
    @description = params["description"]
    @id = params["id"]
  end
end
