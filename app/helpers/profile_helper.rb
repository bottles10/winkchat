module ProfileHelper
    def profile_avatar_select(user)
        if user.avatar.attached?
            image_tag user.avatar.url , class: 'w-[240px] rounded-full', id: "avatar-preview"
        else
            image_tag 'placeholder.png', class: ' w-[240px] rounded-full', id: "avatar-preview"
        end
    end
end 
