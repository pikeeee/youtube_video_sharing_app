# frozen_string_literal: true

# == Schema Information
#
# Table name: videos
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Video < ApplicationRecord
  belongs_to :user
end
