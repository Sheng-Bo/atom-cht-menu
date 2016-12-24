module.exports =

	activate: (state) ->
		# console.log atom
		setTimeout(@delay, 0, this)


	delay: (that) ->
		CSON = require 'cson'
		defM = CSON.load __dirname + "/../def/menu_#{process.platform}.cson"
		defC = CSON.load __dirname + "/../def/context.cson"

		# Menu
		that.updateMenu(atom.menu.template, defM.Menu)
		atom.menu.update()

		# ContextMenu
		that.updateContextMenu(defC.Context)

		# Settings
		that.updateSettings()


	updateMenu: (menuList, def) ->
		return if not def
		for menu in menuList
			continue if not menu.label
			key = menu.label
			set = def[key]
			continue if not set
			menu.label = set.value if set?
			if menu.submenu?
				@updateMenu(menu.submenu, set.submenu)


	updateContextMenu: (def) ->
		for itemSet in atom.contextMenu.itemSets
			set = def[itemSet.selector]
			continue if not set
			for item in itemSet.items
				continue if item.type is "separator"
				label = set[item.command]
				item.label = label if label?


	updateSettings: (def) ->
		settings = require './../def/settings'
		settings.localize()
		@localizeButtons()

		#---
		atom.workspace.observeTextEditors (settings) ->
			console.log 'observeTextEditors'
			if settings?
				if settings.uri?
					if settings.uri.indexOf('atom://config') isnt -1
						settings = require './../def/settings'
						settings.localize()

		atom.workspace.observeActivePaneItem (settings) ->
			console.log 'observeActivePaneItem'
			if settings?
				if settings.uri?
					if settings.uri.indexOf('atom://config') isnt -1
						settings = require './../def/settings'
						settings.localize()

		atom.workspace.observeActivePane (settings) ->
			console.log 'observeActivePane'
			if settings?
				if settings.uri?
					if settings.uri.indexOf('atom://config') isnt -1
						settings = require './../def/settings'
						settings.localize()

		atom.workspace.observePanes (settings) ->
			console.log 'observePanes'
			if settings?
				if settings.uri?
					if settings.uri.indexOf('atom://config') isnt -1
						settings = require './../def/settings'
						settings.localize()


		#---
		atom.workspace.onDidChangeActivePaneItem (settings) ->
			console.log 'onDidChangeActivePaneItem'
			if settings?
				if settings.uri?
					if settings.uri.indexOf('atom://config') isnt -1
						settings = require './../def/settings'
						settings.localize()

		atom.workspace.onDidStopChangingActivePaneItem (settings) ->
			console.log 'onDidStopChangingActivePaneItem'
			if settings?
				if settings.uri?
					if settings.uri.indexOf('atom://config') isnt -1
						settings = require './../def/settings'
						settings.localize()


		#---
		atom.workspace.observePaneItems (settings) ->
			console.log 'observePaneItems'
			if settings?
				if settings.uri?
					if settings.uri.indexOf('atom://config') isnt -1
						settings = require './../def/settings'
						settings.localize()

		atom.workspace.onDidAddPaneItem (settings) ->
			console.log 'onDidAddPaneItem'
			if settings?
				if settings.uri?
					if settings.uri.indexOf('atom://config') isnt -1
						settings = require './../def/settings'
						settings.localize()

		atom.workspace.onDidOpen (settings) ->
			console.log 'onDidOpen'
			if settings?
				if settings.uri?
					if settings.uri.indexOf('atom://config') isnt -1
						settings = require './../def/settings'
						settings.localize()

		atom.workspace.onDidAddPane (settings) ->
			console.log 'onDidAddPane'

		atom.workspace.onWillDestroyPane (settings) ->
			console.log 'onWillDestroyPane'

		atom.workspace.onDidDestroyPane (settings) ->
			console.log 'onDidDestroyPane'

		atom.workspace.onDidChangeActivePane (settings) ->
			console.log 'onDidChangeActivePane'

		atom.workspace.onWillDestroyPaneItem (settings) ->
			console.log 'onWillDestroyPaneItem'

		atom.workspace.onDidDestroyPaneItem (settings) ->
			console.log 'onDidDestroyPaneItem'

		atom.workspace.onDidAddTextEditor (settings) ->
			console.log 'onDidAddTextEditor'


	localizeButtons: () ->
		$ = require('jquery')
		sb = setInterval((->

			pref = $('.settings-view')
			pane = $('.panes')

			# ----- Translate Panel Item Name (Loop) ----- #
			pane.find('ul.tab-bar > li.tab > div:contains("Settings")').text('偏好設定')

			# ----- Translate Update Page ----- #
			pref.find('button:contains("Check for Updates")').html '檢查更新'
			pref.find('button:contains("Update All")').html '更新全部'

			# ----- Translate Install Page ----- #
			pref.find('button:contains("Packages")').html '擴充套件'
			pref.find('button:contains("Themes")').html '佈景主題'

			pref.find('.section-heading.icon.icon-plus:contains("Install Packages")').html('新增擴充套件')
			pref.find('.section-heading.icon.icon-plus:contains("Install Themes")').html('新增佈景主題')

			temp = pref.find('span:contains("Packages are published to ")').parent().children()
			temp.eq(1).html('擴充套件皆發佈在 ')
			temp.eq(3).html (index, html) ->
				html.replace ' and are installed to ', ' 並安裝於 '
			temp.eq(3).after('<span> 資料夾下。</span>') if temp.length == 4

			temp = pref.find('span:contains("Themes are published to ")').parent().children()
			temp.eq(1).html('佈景主題皆發佈在 ')
			temp.eq(3).html (index, html) ->
				html.replace ' and are installed to ', ' 並安裝於 '
			temp.eq(3).after('<span> 資料夾下。</span>') if temp.length == 4

			pref.find('.section-heading.icon.icon-star:contains("Featured Packages")').html('熱門擴充套件')
			pref.find('.section-heading.icon.icon-star:contains("Featured Themes")').html('熱門佈景主題')

			# ----- Package or Theme Card ----- #
			pref.find('button:contains("Update to")').html (index, html) ->
				html.replace 'Update to', '更新至'
			pref.find('button:contains("Update")').html '更新'
			pref.find('button:contains("Install Alternative")').html '安裝新版'
			pref.find('button:contains("Install")').html '安裝'
			pref.find('button:contains("Settings")').html '設定'
			pref.find('button:contains("Uninstall")').html '移除'
			pref.find('button .disable-text:contains("Disable")').html '停用'
			pref.find('button .disable-text:contains("Enable")').html '啟用'

			# ----- Settings Page of Package or Theme ----- #
			pref.find('button:contains("View on Atom.io")').html '在 Atom.io 瀏覽此套件'
			pref.find('button:contains("Report Issue")').html '提出 Issue'
			pref.find('button:contains("CHANGELOG")').html '更新紀錄'
			pref.find('button:contains("LICENSE")').html '授權條款'
			pref.find('button:contains("View Code")').html '檢視原始碼'

			temp = pref.find('.icon.icon-dashboard:contains("This package added ")')
			if temp.length != 0
				temp.html temp.html().replace('This package added ', '這個套件增加了 ').replace(' to startup time.', ' 的啟動時間。')

			return
		), 0)
