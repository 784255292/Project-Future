
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    printf("MainScene:ctor")
    local ttf = ui.newTTFLabel({text = "Hello World, My Dream!", size = 32, align = ui.TEXT_ALIGN_CENTER})
        ttf:pos(display.cx, display.cy)
        self:addChild(ttf)

	self.coin = display.newSprite("DemoLogin/star2.png", display.left + 100, display.cy)
    self:addChild(self.coin)
        
    --CCS
    self.uiTouchGroup = TouchGroup:create()
    self:addChild(self.uiTouchGroup)

    self.uiWidget = GUIReader:shareReader():widgetFromJsonFile("DemoLogin/DemoLogin.json")
    self.uiTouchGroup:addWidget(self.uiWidget)

    self.uiWidget:setAnchorPoint(cc.point(0.5,0.5))
    self.uiWidget:setPosition(cc.point(display.cx, display.cy))
    
    local ccsButton = self.uiWidget:getChildByName("login_Button")
    ccsButton:addTouchEventListener(handler(self, self.onClick))

end

function MainScene:onEnter()
end

function MainScene:onExit()
end

function MainScene:onClick()
    printf("login_Button")
    self.uiWidget:setVisible(false)
end

return MainScene
