local PANEL = {
	Init = function( self )
		self:SetSize(1200,720)
		self:Center()
		self:SetVisible( true )
		
		local x, y = self:GetSize()

		surface.SetFont( "DermaLarge" )
		local titleX, titleY = surface.GetTextSize( "OutlawRP - DarkRP" )

		local title = vgui.Create( "DLabel", self )
		title:SetText("OutlawRP - DarkRP")
		title:SetSize( titleX, titleY )
		title:SetPos( 6, 6)
		title:SetFont( "DermaLarge")
		title:SetTextColor ( Color( 0,255,0 ) )
		title:SetExpensiveShadow( 2, Color( 70, 70, 70 ))

		local closebutton = vgui.Create( "DButton", self )
		closebutton:SetText( "Close" )
		closebutton:SetSize(30,25)
		closebutton:SetPos( x-35, 6 )
		closebutton.Paint = function( self, w, h )
		end
		closebutton.DoClick = function()
			CSF4Menu:SetVisible( false )
			gui.EnableScreenClicker( false )
		end

		local removebutton = vgui.Create( "DButton", self )
		removebutton:SetText( "Reset" )
		removebutton:SetSize(30,25)
		removebutton:SetPos( x-70, 6 )
		removebutton.Paint = function( self, w, h )
			surface.SetDrawColor ( 255, 255, 255, 220 )
			surface.DrawRect( 0,0, w, h )
		end
		removebutton.DoClick = function()
			gui.EnableScreenClicker( false )
			CSF4Menu:Remove()
			CSF4Menu = vgui.Create( "cs_f4_menu" )
			CSF4Menu:SetVisible( false )
		end

		local pagesback = vgui.Create( "DPanel", self )
		pagesback:SetPos( 6, 37 )
		pagesback:SetSize( x-12, y-46 )
		pagesback.Paint = function ( self, w, h )
			surface.SetDrawColor ( 50, 50, 50, 220 )
			surface.DrawRect( 0,0, w, h )
		end

		local pages = vgui.Create ("CSDColSheet", pagesback )
		pages:Dock( FILL )

		local jobs = vgui.Create( "DScrollPanel", pages )
		jobs:Dock( FILL )
		jobs.Paint = function ( self, w, h )
			surface.SetDrawColor ( 255, 255, 255, 75 )
			surface.DrawRect( 0,0, w, h )
		end
		pages:AddSheet( "Jobs", jobs, "icon16/user.png" )

		for k, v in pairs(RPExtraTeams) do

			local jobback = vgui.Create ( "DPanel", jobs )
			jobback:Dock( TOP )
			jobback:SetSize( 0, 200 )
			jobback:DockMargin( 5, 5, 5, 5 )
			jobback.Paint = function( self, w, h )
				surface.SetDrawColor ( 75, 75, 75, 55 )
				surface.DrawRect( 0, 0, w, h )
			end
			
			local names = vgui.Create ( "DLabel", jobback )
			names:SetText( v.name )
			names:Dock ( TOP )
			names:DockMargin(5, 5, 0, 0 )
			names:SetFont( "DermaLarge" )
			names:SetTextColor( Color( 255, 255 ,255 ) )
		
		if util.IsValidModel( v.model[1] ) then
			local models = vgui.Create ( "SpawnIcon", jobback )
			models:Dock( LEFT )
			models:SetSize( 150, 50)
			models:DockMargin( 5, 5, 5, 5 )
			models:SetModel( v.model[1] )
		else
			local models = vgui.Create ( "SpawnIcon", jobback )
			models:Dock( LEFT )
			models:SetSize( 150, 50)
			models:DockMargin( 5, 5, 5, 5 )
			models:SetModel( v.model )
		end

			local desback = vgui.Create ( "DPanel", jobback )
			desback:Dock( FILL )
			desback:SetSize( 0, 150 )
			desback:DockMargin( 5, 5, 5, 5 )
			desback.Paint = function( self, w, h )
				surface.SetDrawColor ( 45, 45, 45, 55 )
				surface.DrawRect( 0, 0, w, h )
		end

			surface.SetFont( "DermaLarge" )
			local desX, desY = surface.GetTextSize( v.description )

			local description = vgui.Create ( "DLabel", desback )
			description:SetText( v.description )
			description:Dock ( TOP )
			description:DockMargin(5, 5, 5, 5 )
			description:SetSize( desX, desY )
			description:SetFont( "Trebuchet18" )
			description:SetTextColor( Color( 255, 255 ,255 ) )

			local become = vgui.Create( "DButton", jobback )
			become:SetText( "Become Job" )
			become:Dock( BOTTOM )
			become:DockMargin( 5, 5, 5, 5 )
			become.Paint = function( self, w, h )
				surface.SetDrawColor( 150, 150, 150, 50 )
				surface.DrawRect( 0, 0, w, h )
				surface.SetDrawColor( 50, 50, 50, 150 )
				surface.DrawOutlinedRect( 0, 0, w, h )
		end
		become.DoClick = function()
			RunConsoleCommand( "say", "/" .. v.command )
		end
	end

		local shop = vgui.Create( "DScrollPanel", pages )
		shop:Dock( FILL )
		shop.Paint = function ( self, w, h )
			surface.SetDrawColor ( 255, 255, 255, 75 )
			surface.DrawRect( 0,0, w, h )
		end
		pages:AddSheet( "Market", shop, "icon16/basket.png" )

		for k, v in pairs(DarkRPEntities) do

			local entback = vgui.Create ( "DPanel", shop )
			entback:Dock( TOP )
			entback:SetSize( 0, 200 )
			entback:DockMargin( 5, 5, 5, 5 )
			entback.Paint = function( self, w, h )
				surface.SetDrawColor ( 75, 75, 75, 55 )
				surface.DrawRect( 0, 0, w, h )
			end
			
			surface.SetFont( "DermaLarge" )
			local entnameX, entnameY = surface.GetTextSize( v.name )

			local entname = vgui.Create ( "DLabel", entback )
			entname:SetText( v.name )
			entname:SetSize( entnameX, entnameY )
			entname:Dock ( TOP )
			entname:DockMargin(5, 5, 0, 0 )
			entname:SetFont( "DermaLarge" )
			entname:SetTextColor( Color( 255, 255 ,255 ) )
		
			local entmodel = vgui.Create ( "SpawnIcon", entback )
			entmodel:Dock( LEFT )
			entmodel:SetSize( 150, 50)
			entmodel:DockMargin( 5, 5, 5, 5 )
			entmodel:SetModel( v.model )

			surface.SetFont( "DermaLarge" )
			local priceX, priceY = surface.GetTextSize( v.name )

			local entprice = vgui.Create ( "DLabel", entback )
			entprice:SetText( "Price: " .. DarkRP.formatMoney(v.price) )
			entprice:SetSize( priceX, priceY )
			entprice:Dock ( TOP )
			entprice:DockMargin(5, 5, 0, 0 )
			entprice:SetFont( "DermaLarge" )
			entprice:SetTextColor( Color( 255, 255 ,255 ) )

			surface.SetFont( "DermaLarge" )
			local entmaX, entmaY = surface.GetTextSize( v.name )

			local entmax = vgui.Create ( "DLabel", entback )
			entmax:SetText( "Max: " .. v.max )
			entmax:SetSize( priceX, priceY )
			entmax:Dock ( TOP )
			entmax:DockMargin(5, 5, 0, 0 )
			entmax:SetFont( "DermaLarge" )
			entmax:SetTextColor( Color( 255, 255 ,255 ) )

			local buybutton = vgui.Create( "DButton", entback )
			buybutton:SetText( "Purchase" )
			buybutton:Dock( BOTTOM )
			buybutton:DockMargin( 5, 5, 5, 5 )
			buybutton.Paint = function( self, w, h )
				surface.SetDrawColor( 150, 150, 150, 50 )
				surface.DrawRect( 0, 0, w, h )
				surface.SetDrawColor( 50, 50, 50, 150 )
				surface.DrawOutlinedRect( 0, 0, w, h )
		end
		buybutton.DoClick = function()
			RunConsoleCommand( "say", "/" .. v.cmd )
		end

	end

		local weapon = vgui.Create( "DScrollPanel", pages )
		weapon:Dock( FILL )
		weapon.Paint = function ( self, w, h )
			surface.SetDrawColor ( 255, 255, 255, 75 )
			surface.DrawRect( 0,0, w, h )
		end
		pages:AddSheet( "Weapons", weapon, "icon16/basket.png" )

		local shiphback = vgui.Create ( "DPanel", weapon )
		shiphback:Dock( TOP )
		shiphback:SetSize( 0, 50 )
		shiphback:DockMargin( 5, 5, 5, 5 )
		shiphback.Paint = function( self, w, h )
			surface.SetDrawColor ( 95, 95, 95, 95 )
			surface.DrawRect( 0, 0, w, h )
		end

		local shiph = vgui.Create ( "DLabel", shiphback )
		shiph:SetText( "Shipments" )
		shiph:Dock ( FILL )
		shiph:DockMargin(5, 0, 0, 0 )
		shiph:SetFont( "DermaLarge" )
		shiph:SetTextColor( Color( 255, 255 ,255 ) )

		for k, v in pairs(CustomShipments) do

			if( v.noship == false ) then
				local shipback = vgui.Create ( "DPanel", weapon )
				shipback:Dock( TOP )
				shipback:SetSize( 0, 200 )
				shipback:DockMargin( 5, 5, 5, 5 )
				shipback.Paint = function( self, w, h )
					surface.SetDrawColor ( 75, 75, 75, 55 )
					surface.DrawRect( 0, 0, w, h )
				end
				
				surface.SetFont( "DermaLarge" )
				local shipnameX, shipnameY = surface.GetTextSize( v.name )

				local shipname = vgui.Create ( "DLabel", shipback )
				shipname:SetText( v.name )
				shipname:SetSize( shipnameX, shipnameY )
				shipname:Dock ( TOP )
				shipname:DockMargin(5, 5, 0, 0 )
				shipname:SetFont( "DermaLarge" )
				shipname:SetTextColor( Color( 255, 255 ,255 ) )
			
				local shipmodel = vgui.Create ( "SpawnIcon", shipback )
				shipmodel:Dock( LEFT )
				shipmodel:SetSize( 150, 50)
				shipmodel:DockMargin( 5, 5, 5, 5 )
				shipmodel:SetModel( v.model )

				surface.SetFont( "DermaLarge" )
				local shippriceX, shippriceY = surface.GetTextSize( "Price: " .. DarkRP.formatMoney(v.price) )

				local shipprice = vgui.Create ( "DLabel", shipback )
				shipprice:SetText( "Price: " .. DarkRP.formatMoney(v.price) )
				shipprice:SetSize( shippriceX, shipamountY )
				shipprice:Dock ( TOP )
				shipprice:DockMargin(5, 5, 0, 0 )
				shipprice:SetFont( "DermaLarge" )
				shipprice:SetTextColor( Color( 255, 255 ,255 ) )

				surface.SetFont( "DermaLarge" )
				local shipamountX, shipamountY = surface.GetTextSize( "Amount: " .. v.amount )

				local shipamount = vgui.Create ( "DLabel", shipback )
				shipamount:SetText( "Amount: " .. v.amount )
				shipamount:SetSize( shipamountX, shipamountY )
				shipamount:Dock ( TOP )
				shipamount:DockMargin(5, 5, 0, 0 )
				shipamount:SetFont( "DermaLarge" )
				shipamount:SetTextColor( Color( 255, 255 ,255 ) )

				local buybutton = vgui.Create( "DButton", shipback )
				buybutton:SetText( "Purchase" )
				buybutton:Dock( BOTTOM )
				buybutton:DockMargin( 5, 5, 5, 5 )
				buybutton.Paint = function( self, w, h )
					surface.SetDrawColor( 150, 150, 150, 50 )
					surface.DrawRect( 0, 0, w, h )
					surface.SetDrawColor( 50, 50, 50, 150 )
					surface.DrawOutlinedRect( 0, 0, w, h )
			end
			buybutton.DoClick = function()
				RunConsoleCommand( "say", "/buyshipment " .. v.name )
			end
		end
	end
		local singlehback = vgui.Create ( "DPanel", weapon )
		singlehback:Dock( TOP )
		singlehback:SetSize( 0, 50 )
		singlehback:DockMargin( 5, 5, 5, 5 )
		singlehback.Paint = function( self, w, h )
			surface.SetDrawColor ( 95, 95, 95, 95 )
			surface.DrawRect( 0, 0, w, h )
		end

		local singleh = vgui.Create ( "DLabel", singlehback )
		singleh:SetText( "Singles" )
		singleh:Dock ( FILL )
		singleh:DockMargin(5, 0, 0, 0 )
		singleh:SetFont( "DermaLarge" )
		singleh:SetTextColor( Color( 255, 255 ,255 ) )

		for k, v in pairs(CustomShipments) do

			if ( v.seperate == true ) then
				local singleback = vgui.Create ( "DPanel", weapon )
				singleback:Dock( TOP )
				singleback:SetSize( 0, 200 )
				singleback:DockMargin( 5, 5, 5, 5 )
				singleback.Paint = function( self, w, h )
					surface.SetDrawColor ( 75, 75, 75, 55 )
					surface.DrawRect( 0, 0, w, h )
				end
				
				surface.SetFont( "DermaLarge" )
				local singlenameX, singlenameY = surface.GetTextSize( v.name )

				local singlename = vgui.Create ( "DLabel", singleback )
				singlename:SetText( v.name )
				singlename:SetSize( singlenameX, singlenameY )
				singlename:Dock ( TOP )
				singlename:DockMargin(5, 5, 0, 0 )
				singlename:SetFont( "DermaLarge" )
				singlename:SetTextColor( Color( 255, 255 ,255 ) )
			
				local singlemodel = vgui.Create ( "SpawnIcon", singleback )
				singlemodel:Dock( LEFT )
				singlemodel:SetSize( 150, 50)
				singlemodel:DockMargin( 5, 5, 5, 5 )
				singlemodel:SetModel( v.model )

				surface.SetFont( "DermaLarge" )
				local singlepriceX, singlepriceY = surface.GetTextSize( "Price: " .. DarkRP.formatMoney(v.pricesep) )

				local singleprice = vgui.Create ( "DLabel", singleback )
				singleprice:SetText( "Price: " .. DarkRP.formatMoney(v.pricesep) )
				singleprice:SetSize( singlepriceX, singleamountY )
				singleprice:Dock ( TOP )
				singleprice:DockMargin(5, 5, 0, 0 )
				singleprice:SetFont( "DermaLarge" )
				singleprice:SetTextColor( Color( 255, 255 ,255 ) )

				surface.SetFont( "DermaLarge" )
				local singleamountX, singleamountY = surface.GetTextSize( "Amount: " .. 1 )

				local singleamount = vgui.Create ( "DLabel", singleback )
				singleamount:SetText( "Amount: " .. 1 )
				singleamount:SetSize( singleamountX, singleamountY )
				singleamount:Dock ( TOP )
				singleamount:DockMargin(5, 5, 0, 0 )
				singleamount:SetFont( "DermaLarge" )
				singleamount:SetTextColor( Color( 255, 255 ,255 ) )

				local buybutton = vgui.Create( "DButton", singleback )
				buybutton:SetText( "Purchase" )
				buybutton:Dock( BOTTOM )
				buybutton:DockMargin( 5, 5, 5, 5 )
				buybutton.Paint = function( self, w, h )
					surface.SetDrawColor( 150, 150, 150, 50 )
					surface.DrawRect( 0, 0, w, h )
					surface.SetDrawColor( 50, 50, 50, 150 )
					surface.DrawOutlinedRect( 0, 0, w, h )
			end
			buybutton.DoClick = function()
				RunConsoleCommand( "say", "/buysinglement " .. v.name )
			end
		end
	end
		local ammo = vgui.Create( "DPanel", pages )
		ammo:Dock( FILL )
		ammo.Paint = function ( self, w, h )
			surface.SetDrawColor ( 255, 255, 255, 75 )
			surface.DrawRect( 0,0, w, h )
		end
		pages:AddSheet( "Ammunition", ammo, "icon16/basket.png" )

		local cmds = vgui.Create( "DPanel", pages )
		cmds:Dock( FILL )
		cmds.Paint = function ( self, w, h )
			surface.SetDrawColor ( 255, 255, 255, 75 )
			surface.DrawRect( 0,0, w, h )
		end
		pages:AddSheet( "Commands", cmds, "icon16/application_xp_terminal.png" )

		local store = vgui.Create( "DPanel", pages )
		store:Dock( FILL )
		store.Paint = function ( self, w, h )
			surface.SetDrawColor ( 255, 255, 255, 75 )
			surface.DrawRect( 0,0, w, h )
		end
		pages:AddSheet( "Store", store, "icon16/coins.png" )

	end,

	Paint = function( self, w, h )
		surface.SetDrawColor( 64,64,64, 150 )
		surface.DrawRect( 0, 0, w, h )
		surface.DrawOutlinedRect( 2, 2, w-4, h-4 )
	end
}
vgui.Register( "cs_f4_menu", PANEL ) 