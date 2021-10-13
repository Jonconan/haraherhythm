require 'securerandom'

MasterSnsService.create(
  name: "twitter"
) unless MasterSnsService.find_by(name: "twitter").present?

MasterSnsService.create(
  name: "facebook"
) unless MasterSnsService.find_by(name: "facebook").present?

MasterSnsService.create(
  name: "youtube"
) unless MasterSnsService.find_by(name: "youtube").present?

MasterSnsService.create(
  name: "instagram"
) unless MasterSnsService.find_by(name: "instagram").present?



puts "Done."
