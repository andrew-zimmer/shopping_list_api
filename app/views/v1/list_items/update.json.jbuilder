json.data do
    json.list_item do
        json.call(
            @list_item,
            :title,
            :checked
        )
    end
end
