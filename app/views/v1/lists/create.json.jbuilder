json.data do
    json.list do
        json.call(
            @list,
            :name,
            :list_items,
            :id,
            :group
        )
    end
end
