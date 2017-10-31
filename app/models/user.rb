class User < ApplicationRecord

  def self.find_or_create_from_auth_hash(auth_hash)
    uid = auth_hash["uid"]

    name = auth_hash["info"]["name"]
    email = auth_hash["info"]["email"]
    image = auth_hash["info"]["image"]
    token = auth_hash["credentials"]["token"]
    user = find_or_create_by(
      uid: uid,
    )
    user.update(
          username: name,
          image_path: image,
          email: email,
          token: token
    )
    user
  end
end
