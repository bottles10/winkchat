module PostsHelper
    def post_image_select(post)
        if post.image.attached?
            image_tag post.image.url , width: "380", id: "image-preview", class: "rounded"
        else
            image_tag 'image-placeholder.jpg', width: "380", id: "image-preview", class: "rounded"
        end
    end
end
