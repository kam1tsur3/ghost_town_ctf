module UsersHelper
    def account_img(user)
        image_tag("default_account.png", alt: user.name, class:"account_img", width: "200px")
    end
end
