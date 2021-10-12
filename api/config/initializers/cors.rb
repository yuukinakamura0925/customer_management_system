Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ["https://customer-management-system.link","http://localhost:8080"]

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
