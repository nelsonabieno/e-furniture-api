# README

E-Commerce Furniture API


# Request Header:
* Authorization : Bearer#YourTokenHere#

# Routes:
* login      POST   /login(.:format)                             authentication#create  
* logout     GET    /logout(.:format)                            authentication#destroy 
######  params: { :email, :password }

*   user_index GET    /user(.:format)                             user#index
*             POST   /user(.:format)                              user#create 
*        user GET    /user/:id(.:format)                          user#show
*             PATCH  /user/:id(.:format)                          user#update
*             PUT    /user/:id(.:format)                          user#update
*             DELETE /user/:id(.:format)                          user#destroy    
######  params: { :first_name, :last_name,:phone_no, :email,:password,:login_status,:profile_img, :street_address,:lga,:city, :state}

*   role     POST   /role(.:format)                                role#create
######  params: { :name }

*   root     GET    /                                              home#index

* product_index  GET    /product(.:format)                           product#index
*                POST   /product(.:format)                           product#create
* product        GET    /product/:id(.:format)                       product#show
*                PATCH  /product/:id(.:format)                       product#update
*                PUT    /product/:id(.:format)                       product#update
*                DELETE /product/:id(.:format)                       product#destroy
######  params: { :name, :description, :color, :material, :image_front, :image_back, :image_left, :image_right,:price, :brand, :size, :user_id, :category_name  }       

* category_index GET    /category(.:format)                          category#index
*                POST   /category(.:format)                          category#create
* category       GET    /category/:id(.:format)                      category#show
*                PATCH  /category/:id(.:format)                      category#update
*                PUT    /category/:id(.:format)                      category#update
*                DELETE /category/:id(.:format)                      category#destroy  
######  params: {:name}  

* user_shipping_detail_index GET    /user/:user_id/shipping_detail(.:format)      shipping_detail#index
*                            POST   /user/:user_id/shipping_detail(.:format)      shipping_detail#create
* user_shipping_detail       GET    /user/:user_id/shipping_detail/:id(.:format)  shipping_detail#show
*                            PATCH  /user/:user_id/shipping_detail/:id(.:format)  shipping_detail#update
*                            PUT    /user/:user_id/shipping_detail/:id(.:format)  shipping_detail#update
*                            DELETE /user/:user_id/shipping_detail/:id(.:format)  shipping_detail#destroy
######  params: {  :recipient_name, :recipient_address, :order_no, :lg_id, :state_id, :phone_no, :city, :user_id }   

* product_order_index       GET    /product/:product_id/order(.:format)         order#index
*                           POST   /product/:product_id/order(.:format)         order#create
* product_order             GET    /product/:product_id/order/:id(.:format)     order#show
*                           PATCH  /product/:product_id/order/:id(.:format)     order#update
*                           PUT    /product/:product_id/order/:id(.:format)     order#update
*                           DELETE /product/:product_id/order/:id(.:format)     order#destroy
######  params: {  :transanction_id, :order_no, :product_id, :order_status }
                      






     
                   
                    
