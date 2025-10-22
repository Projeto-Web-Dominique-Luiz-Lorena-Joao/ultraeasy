json.extract! company, :id, :name, :ein, :email, :phone, :address, :website, :created_at, :updated_at
json.url company_url(company, format: :json)
