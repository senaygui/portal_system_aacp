class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :trackable
  has_person_name
  has_one_attached :photo, dependent: :destroy
  belongs_to :cell, optional: true
  has_many :committees
  has_many :student_attendances
  has_many :financial_reports, dependent: :destroy
  has_many :paid_members, dependent: :destroy
  ##validations
    # validates :username , :presence => true,:length => { :within => 2..50 }
    validates :first_name , :presence => true,:length => { :within => 2..50 }
    validates :last_name , :presence => true,:length => { :within => 1..50 }
    validates :role , :presence => true
    # validates :photo, attached: true, content_type: ['image/gif', 'image/png', 'image/jpg', 'image/jpeg']
  ## scope

    scope :recently_added, lambda { where('created_at >= ?', 1.week.ago)}
    scope :total_users, lambda { order("created_at DESC")}
    scope :admins, lambda { where(:role => "admin") }
    scope :registrars, lambda { where("role = ?", "%registrar%") }
    scope :finances, lambda { where("role = ?", "%finance%") }
    scope :president, lambda { where(:role => "president") }
    scope :vice_presidents, lambda { where(:role => "vice president") }
    scope :quality_assurances, lambda { where(:role => "quality assurance") }
    scope :deans, lambda { where(:role => "dean") }
    scope :library, lambda { where(:role => "library") }
    scope :department_heads, lambda { where(:role => "department head") }
    scope :program_offices, lambda { where(:role => "program office") }

    ## associations
      has_many :course_instructors
      belongs_to :department, optional: true


      before_save :ensure_utf8_encoding

  private

  def ensure_utf8_encoding
    attributes.each do |key, value|
      self[key] = value.encode("UTF-8", invalid: :replace, undef: :replace, replace: "") if value.is_a?(String)
    end
  end
end