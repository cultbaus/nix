return function(awful)
    local m = {}

    function m.left_click(action)
        print 'click'
        return awful.button({}, 1, action)
    end

    function m.right_click(action)
        print 'click middle'
        return awful.button({}, 2, action)
    end

    function m.middle_click(action)
        print 'click right'
        return awful.button({}, 3, action)
    end

    return m
end
