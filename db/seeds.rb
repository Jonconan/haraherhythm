require 'securerandom'

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "joker@example.com",
  password: "password",
  name: "雨宮 蓮",
  nickname: "ジョーカー",
  birthday: "1991-10-20",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "joker@example.com").present?

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "morgana@example.com",
  password: "password",
  name: "モル ガナ",
  nickname: "モナ",
  birthday: "1991-01-01",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "morgana@example.com").present?

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "skull@example.com",
  password: "password",
  name: "坂本 竜司",
  nickname: "スカル",
  birthday: "1991-07-03",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "skull@example.com").present?

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "panther@example.com",
  password: "password",
  name: "高巻 杏",
  nickname: "パンサー",
  birthday: "1991-11-12",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "panther@example.com").present?

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "fox@example.com",
  password: "password",
  name: "喜多川 祐介",
  nickname: "フォックス",
  birthday: "1991-01-28",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "fox@example.com").present?

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "queen@example.com",
  password: "password",
  name: "新島 真",
  nickname: "クイーン",
  birthday: "1991-04-23",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "queen@example.com").present?

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "navi@example.com",
  password: "password",
  name: "佐倉 双葉",
  nickname: "ナビ",
  birthday: "1991-02-19",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "navi@example.com").present?

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "noir@example.com",
  password: "password",
  name: "奥村 春",
  nickname: "ノワール",
  birthday: "1991-12-05",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "noir@example.com").present?

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "violet@example.com",
  password: "password",
  name: "芳澤 かすみ",
  nickname: "ヴァイオレット",
  birthday: "1991-03-25",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "violet@example.com").present?

Artist.create(
  code: SecureRandom.alphanumeric,
  email: "crow@example.com",
  password: "password",
  name: "明智 吾郎",
  nickname: "クロウ",
  birthday: "1991-06-02",
  postal_code: "3500214",
  address_1: "埼玉県",
  address_2: "坂戸市千代田",
  address_3: "3-21-23 ヴィラ・ボンセジュール若葉307"
) unless Artist.find_by(email: "crow@example.com").present?

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
