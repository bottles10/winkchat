module UsersHelper

    def avatar_image_select(post)
        if post.user.avatar.attached?
            image_tag post.user.avatar.url , class: 'inline w-[50px] rounded-full'
        else
            image_tag 'placeholder.png', class: 'inline rounded-full'
        end
    end
end 