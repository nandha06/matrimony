class Physicaldetail < ActiveRecord::Base
	enum physical_status: [ :Normal, :Physically_challanged]
	enum body_type: [ :Slim, :Average, :Heavy]
end
