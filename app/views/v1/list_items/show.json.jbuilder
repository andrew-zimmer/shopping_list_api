json.data do
    json.list_item do
        json.call(
            @list_item,
            :item,
            :checked,
            :id,
            :list
        )
    end
end
