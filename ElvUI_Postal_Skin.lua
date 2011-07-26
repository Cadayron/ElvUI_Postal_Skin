local UI
if ElvUI then UI=ElvUI else UI=Tukui end
local T, C, L, DB = unpack(UI)


local SkinPostal = CreateFrame("Frame")
	SkinPostal:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinPostal:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end
	if not IsAddOnLoaded("Postal") then return end

	-- local buttons = {
        -- "PostalSelectOpenButton",
		-- "PostalSelectReturnButton",
		-- "PostalOpenAllButton",
	-- }
	-- for _, button in pairs(buttons) do
		-- if button == "PostalOpenAllButton" then
			-- if not _G["PostalOpenAllButton"] then break else
				-- T.SkinButton(_G[button])
			-- end
		-- end
	-- end

	--Skin Button
	T.SkinButton(_G["PostalSelectOpenButton"])
	T.SkinButton(_G["PostalSelectReturnButton"])
	
	for i = 1, INBOXITEMS_TO_DISPLAY do
		local b = _G["MailItem"..i.."ExpireTime"]
			b:SetPoint("TOPRIGHT", "MailItem"..i, "TOPRIGHT", -5, -10)
			b.returnicon:SetPoint("TOPRIGHT", b, "TOPRIGHT", 20, 0)	
	end
	
	--Skin CheckBoxes
	for i = 1, INBOXITEMS_TO_DISPLAY do
		local cb = _G["PostalInboxCB"..i]
		cb:StripTextures()
		T.SkinCheckBox(cb)
	end
	
	--Move InboxPrevPageButton
	InboxPrevPageButton:SetPoint("TOPLEFT", MailItem7, "BOTTOMLEFT", -20, 0)
	
	-- Skin Dropdown Boxes		
	T.SkinNextPrevButton(Postal_ModuleMenuButton)
	Postal_ModuleMenuButton:SetPoint("TOPRIGHT", MailFrame, -58, -16)
	
	T.SkinNextPrevButton(Postal_BlackBookButton)
	Postal_BlackBookButton:SetPoint("LEFT", SendMailNameEditBox, "RIGHT", 5, 2)
	
	--Don'tWant OpenAll
	if not _G["PostalOpenAllButton"] then return else
		T.SkinButton(_G["PostalOpenAllButton"])
		PostalOpenAllButton:SetPoint("CENTER", InboxFrame, "TOP", -22, -410)
		Postal_OpenAllMenuButton:SetPoint("LEFT", PostalOpenAllButton, "RIGHT", 5, 0)
		T.SkinNextPrevButton(Postal_OpenAllMenuButton)
	end

end)