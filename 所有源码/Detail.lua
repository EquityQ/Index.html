local fl_ena_ref,fl_hot_ref =ui.reference("AA", "Fake lag", "Enabled")
local fl_amount_ref = ui.reference("AA", "Fake lag", "Amount")
local fl_var_ref =ui.reference("AA", "Fake lag", "Variance")
local fl_limit_ref = ui.reference("AA", "Fake lag", "Limit")

fl_type ={"Shooting","Freestanding","Moving","Airing","Crouching","Slow Walking","Peeking"}
fl_mode_type ={"Random","Fixed Random","Static"}

local ui_fl_amount = ui.new_combobox("AA", "Fake lag", "[Detail] FakeLag Amount Mode Setting","Dynamic","Maximum","Fluctuate","Static")

local TickDelay = globals.tickcount()
client.set_event_callback("setup_command", function(cmd)
    if ui.get(ui_fl_amount) =="Static" then
  if TickDelay < globals.tickcount() then
    cmd.allow_send_packet = true
    TickDelay = globals.tickcount() + ui.get(fl_limit_ref) 
  else
    cmd.allow_send_packet = false
  end
end
end)

client.set_event_callback("setup_command", function()
    if ui.get(ui_fl_amount)~="Static"then
        ui.set(fl_amount_ref,ui.get(ui_fl_amount))
    end
end)


local ui_fl_mode = ui.new_combobox("AA", "Fake lag", "[Detail] FakeLag Type Setting",fl_type[1],fl_type[2],fl_type[3],fl_type[4],fl_type[5],fl_type[6],fl_type[7])
local ui_fl_shoot_wait_time = ui.new_slider("AA", "Fake lag", "[Detail]Shooting FakeLag Keep Time", 3, 100, 30, true, "s", 0.01)

client.set_event_callback("paint_ui", function()
    ui.set(fl_ena_ref,true)
    ui.set(fl_hot_ref,"Always on")
    if ui.get(ui_fl_mode)~="Shooting"then
        ui.set_visible(ui_fl_shoot_wait_time, false)
    else
        ui.set_visible(ui_fl_shoot_wait_time, true)
    end
end)

fl_name = {}
function fl_ui_add()
    for i = 1 , #fl_type do
        fl_name[i] = {
            ["Mode"] = ui.new_combobox("AA", "Fake lag", "[Detail] "..fl_type[i].." FakeLag Random Mode Setting",fl_mode_type[1],fl_mode_type[2],fl_mode_type[3]),
            ["Random_min"] = ui.new_slider("AA", "Fake lag", "[Detail] "..fl_type[i].." FakeLag Random Minimum",1, 17, 6),
            ["Random_max"] = ui.new_slider("AA", "Fake lag", "[Detail] "..fl_type[i].." FakeLag Random Maximum",1, 17, 6),
            ["Fixed"] = ui.new_slider("AA", "Fake lag", "[Detail] "..fl_type[i].." FakeLag Fixed Value",1, 17, 6),
            ["Fixed_min"] = ui.new_slider("AA", "Fake lag", "[Detail] "..fl_type[i].." FakeLag Fixed Minimum",1, 17, 6),
            ["Fixed_max"] = ui.new_slider("AA", "Fake lag", "[Detail] "..fl_type[i].." FakeLag Fixed Maximum",1, 17, 6),
            ["Static"] = ui.new_slider("AA", "Fake lag", "[Detail] "..fl_type[i].." FakeLag Static Value",1, 17, 6),
        }
    end
end
fl_ui_add()

client.set_event_callback("paint_ui", function()
    for i = 1 ,#fl_type do
        if ui.get(ui_fl_mode) == fl_type[i] then
            for k = 1 , i - 1 do
                ui.set_visible(fl_name[k]["Mode"],false)
                ui.set_visible(fl_name[k]["Random_min"],false)
                ui.set_visible(fl_name[k]["Random_max"], false)
                ui.set_visible(fl_name[k]["Fixed"], false)
                ui.set_visible(fl_name[k]["Fixed_min"], false)
                ui.set_visible(fl_name[k]["Fixed_max"], false)
                ui.set_visible(fl_name[k]["Static"], false)
            end
            for c = i + 1 , #fl_type do 
                ui.set_visible(fl_name[c]["Mode"],false)
                ui.set_visible(fl_name[c]["Random_min"],false)
                ui.set_visible(fl_name[c]["Random_max"], false)
                ui.set_visible(fl_name[c]["Fixed"], false)
                ui.set_visible(fl_name[c]["Fixed_min"], false)
                ui.set_visible(fl_name[c]["Fixed_max"], false)
                ui.set_visible(fl_name[c]["Static"], false)
            end
            ui.set_visible(fl_name[i]["Mode"],true)
            if ui.get(fl_name[i]["Mode"]) == "Random" then
                ui.set_visible(fl_name[i]["Random_min"], true)
                ui.set_visible(fl_name[i]["Random_max"], true)
                ui.set_visible(fl_name[i]["Fixed"], false)
                ui.set_visible(fl_name[i]["Fixed_min"], false)
                ui.set_visible(fl_name[i]["Fixed_max"], false)
                ui.set_visible(fl_name[i]["Static"], false)
            elseif ui.get(fl_name[i]["Mode"]) == "Fixed Random" then
                ui.set_visible(fl_name[i]["Random_min"], false)
                ui.set_visible(fl_name[i]["Random_max"], false)
                ui.set_visible(fl_name[i]["Fixed"], true)
                ui.set_visible(fl_name[i]["Fixed_min"], true)
                ui.set_visible(fl_name[i]["Fixed_max"], true)
                ui.set_visible(fl_name[i]["Static"], false)
            else
                ui.set_visible(fl_name[i]["Random_min"],false)
                ui.set_visible(fl_name[i]["Random_max"], false)
                ui.set_visible(fl_name[i]["Fixed"], false)
                ui.set_visible(fl_name[i]["Fixed_min"], false)
                ui.set_visible(fl_name[i]["Fixed_max"], false)
                ui.set_visible(fl_name[i]["Static"], true)
            end
        end
    end
end)

fl_tp = 2
client.set_event_callback("setup_command", function()
    local peek_ref,peek_kot_ref =ui.reference("Rage", "Other", "Quick peek assist")
    local sl_ref,sl_hot_ref =ui.reference("AA", "Other", "Slow motion")
    local value = entity.get_prop(entity.get_local_player(), "m_fFlags")
    local vec = entity.get_prop(entity.get_local_player(),  "m_vecVelocity[0]")
    local vec_1 = entity.get_prop(entity.get_local_player(),  "m_vecVelocity[1]")
    local speed  = math.modf(math.sqrt(vec*vec+vec_1*vec_1))
    if speed ==1 then
        speed =0
    end
    if aim == 1 then --shooting
        fl_tp = 1 
    elseif value == 263 or value == 261 then --ducking
        fl_tp = 5
    elseif value == 256 or value == 262 then -- in the air 
        fl_tp = 4
    elseif ui.get(peek_ref) and ui.get(peek_kot_ref) then--peeking
        fl_tp = 7
    elseif ui.get(sl_ref) and ui.get(sl_hot_ref) then --slow walking
        fl_tp = 6
    elseif speed <5 and value == 257 then--freestanding
        fl_tp = 2
    elseif speed >90 and value == 257 then--moving
        fl_tp = 3
    end
end)

aim = 0
client.set_event_callback("aim_fire", function()
    aim = 1 
    client.delay_call(ui.get(ui_fl_shoot_wait_time)/100, function()
        aim = 0
    end)
end)

client.set_event_callback("setup_command", function()
    if ui.get(fl_name[fl_tp]["Mode"]) == "Random" then
        ui.set(fl_limit_ref,client.random_int(ui.get(fl_name[fl_tp]["Random_min"]), ui.get(fl_name[fl_tp]["Random_max"])))
    elseif ui.get(fl_name[fl_tp]["Mode"]) == "Fixed Random" then
        local rad = client.random_int(0, 10)
        if rad > 5 then
            ui.set(fl_limit_ref,ui.get(fl_name[fl_tp]["Fixed"]))
        else
            ui.set(fl_limit_ref,client.random_int(ui.get(fl_name[fl_tp]["Fixed_min"]), ui.get(fl_name[fl_tp]["Fixed_max"])))
        end
    else
        ui.set(fl_limit_ref,ui.get(fl_name[fl_tp]["Static"]))
    end
end)




color= {}
color[0] = 255
color[1] = 0
end_1 = 0
end_2 = 0
end_3 = 0
function copyright()

    local a = color[0]
    local b = color[1]

    if a == 0 then
        end_1 = 1
        elseif a== 255 then
        end_1 = 0
        end
        if end_1 == 0 then
            color[0]= a-1
        elseif end_1 == 1 then
            color[0] = a+1
        end

        if b == 0 then
        end_2 = 1
        elseif b == 225 then
        end_2 = 0
        end
        if end_2==0 then
            color[1] =b-1
        elseif end_2 == 1 then
            color[1] = b+1
        end


end
client.set_event_callback("paint", copyright)

end_end = 0
color[3] = 77
pitch = 0
function paint_logo()
    local x,y = client.screen_size()
    local x1,y1 = 80,y/2+280
    local at = color[0]
    local b3 = color[1]


    local time_hour,time_minute,time_seconde,time_mili = client.system_time()
    local value_cc = client.random_int(145, 255)
    local value_cc_1 = client.random_int(0, 145)
    if end_end == 0 then
        if pitch ==0 then
        if time_seconde== 3 or time_seconde==6  or time_seconde== 9 or time_seconde==12 or time_seconde==15 or time_seconde==18 or time_seconde==21 or time_seconde==24  or time_seconde==27 or time_seconde==30 or time_seconde==33 or time_seconde==36 or time_seconde==39 or time_seconde==42 or time_seconde==45 or time_seconde==48 or time_seconde==51 or time_seconde==54 or time_seconde==57 or time_seconde==0 or time_seconde==60 then
        end_end = 1
        color[3] = value_cc
        pitch = 1
        client.delay_call(1, function()
        end_end = 0
        end)
    end
else
    
        if time_seconde== 3 or time_seconde==6  or time_seconde== 9 or time_seconde==12 or time_seconde==15 or time_seconde==18 or time_seconde==21 or time_seconde==24  or time_seconde==27 or time_seconde==30 or time_seconde==33 or time_seconde==36 or time_seconde==39 or time_seconde==42 or time_seconde==45 or time_seconde==48 or time_seconde==51 or time_seconde==54 or time_seconde==57 or time_seconde==0 or time_seconde==60 then
        end_end = 1
        color[3] = value_cc_1
        pitch = 0
        client.delay_call(1, function()
        end_end = 0
        end)
    end
end
end
end


client.set_event_callback("paint", paint_logo)
local sv_maxusrcmdprocessticks = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks")
ui.set(sv_maxusrcmdprocessticks,18)

local fl_ind_chk = ui.new_checkbox("AA", "Fake lag", "[Detail] Fakelag Ind")
function fl_ind()

local dragging_2 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()




local hk_dragger = dragging_2.new("Resolver Indicators", 500, 600)





local value= {0,0,0,0,0,0,0,0,0,0,0,0,0,0}
function delay_c()
	for i = 1 , #value do
		value[i] = client.random_int(17, 44)
	end
	client.delay_call(5, delay_c)
end
delay_c()
local fl_lim_ref = ui.reference("AA", "Fake lag", "Limit")
time = 1
fl_value_tab = {0,0,0,0,0}
client.set_event_callback("setup_command",function()
    if time == 1 then
        time = 2 
    elseif time == 2 then
        time =3 
    elseif time == 3 then
        time = 4 
    elseif time == 4 then
        time = 5 
    elseif time == 5 then
        time = 1 
    end
    fl_value_tab[time] = ui.get(fl_lim_ref)
end)


client.set_event_callback("paint", function(e)
    if ui.get(fl_ind_chk)then

	local active_players = 0
	local x, y =  hk_dragger:get()
	local player = entity.get_players(true)
	local weapon_r, weapon_g, weapon_b, weapon_a = color[0], color[1] ,130, 180
	local alpha = 1 + math.sin(math.abs(- math.pi + globals.realtime() % (math.pi * 2))) * 219
	local pulse = 8 + math.sin(math.abs(- math.pi + (globals.realtime() * (0.6 / 1)) % (math.pi * 2))) * 12
	


		local addiction_y = 70
		client.draw_gradient(ctx, x + 5, y, 218, 10, 0, 0, 0, 20, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y, 223, 20 + addiction_y, 0, 0, 0, 200, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y - 2, 40 + pulse * 3, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y, pulse * 0.7, 20 + addiction_y, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y + 20 + addiction_y, 120 + pulse * 5, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 20, true)
		renderer.text(x + 10, y + 3, 255, 155, 155, 180, "", 0, "")
		renderer.text(active_players <= 0 and x + 50 or x + 50, y + 3, active_players <= 0 and weapon_r or 255, active_players <= 0 and weapon_g or 155, active_players <= 0 and weapon_b or 155, alpha, "", 0, active_players <= 0 and "[Detail] FakeLag Indicators" or "[Detail] FakeLag Indicators")
		renderer.text(x + 155, y + 3, 128, 183, 255, 255, "", 0, "  ")


		renderer.text(x + 50, y + 3+13, 0,255,255, 180, "", 0, "History : "..fl_value_tab[1].."-"..fl_value_tab[2].."-"..fl_value_tab[3].."-"..fl_value_tab[4].."-"..fl_value_tab[5])
        renderer.text(x + 50, y + 3+23, 0,255,255, 180, "", 0, "Amount >> "..ui.get(ui_fl_amount))
        local c_v = ui.get(ui_fl_shoot_wait_time)/100
        renderer.text(x + 50, y + 3+33, 0,255,255, 180, "", 0, "Waiting >> "..c_v.."s")
        renderer.text(x + 50, y + 3+43, 0,255,255, 180, "", 0, "Random Mode : "..ui.get(fl_name[fl_tp]["Mode"]))

        local vec = entity.get_prop(entity.get_local_player(),  "m_vecVelocity[0]")
    local vec_1 = entity.get_prop(entity.get_local_player(),  "m_vecVelocity[1]")
    local speed  = math.modf(math.sqrt(vec*vec+vec_1*vec_1))
    if speed ==1 then
        speed =0
    end

    renderer.text(x + 50, y + 3+53, 0,255,255, 180, "", 0, "Speed : "..speed)

    renderer.text(x + 50, y + 3+63, 0,255,255, 180, "", 0, "Mode : "..fl_type[fl_tp])

    renderer.text(x + 50, y + 3+73, 0,255,255, 180, "", 0, "Double Tap : "..ui.get(sv_maxusrcmdprocessticks).." Tick")
	hk_dragger:drag(200, 20 + 70)
end
end)
-- 111111 saughter
local function Reset()ui.set(Resetlist,true)death_invert={}antibrute={}tries={}resolved={}high_delta={}Headshot={}side = {}guess_num = {}end

end
fl_ind()



hitgroup_names = {"身体", "头", "胸", "胃部", "左臂", "右臂", "左腿", "右腿", "脖子", "未知部位", "边缘"}
local hit_log_chk = ui.new_checkbox("Config", "Lua", "[Detail] Hitlogs")
local hitlog_color = ui.new_color_picker("Config", "Lua", "[Detail] Hitlogs color", 0,255,0, 255)
local chat_chk = ui.new_checkbox("Config", "Lua", "[Detail] Chat Hitlogs")
client.set_event_callback("paint_ui", function()
    if ui.get(hit_log_chk)then
        ui.set_visible(chat_chk,true)
    else
        ui.set_visible(chat_chk,false)
    end
end)
function aim_fire(e)
    
        chance = math.floor(e.hit_chance)
        pred_victim_name = entity.get_player_name(e.target)
        pred_damage = e.damage
        if globals.tickcount() - e.tick ~= nil then
        backtrack = globals.tickcount() - e.tick 
        else
            backtrack = 0
        end
        boosted = e.boosted
        high_prio = e.high_priority

end


local chat = require "gamesense/chat"
client.set_event_callback("aim_fire", aim_fire)
function aim_hit(e)
    local r,g,b,a = ui.get(hitlog_color)
    if ui.get(hit_log_chk)then
        local group = hitgroup_names[e.hitgroup + 1] or "?"
        local name = entity.get_player_name(e.target)
        local damage = e.damage
        local hp_left = entity.get_prop(e.target, "m_iHealth")
        client.color_log(r,g,b, string.format("[Detail] 你击中了 %s 的 %s 并造成 %s 伤害 | 命中率: %s  | 回溯: %s Tick| 完全解析: %s", name, group, damage, chance, backtrack, boosted and "是" or "否"))
        if ui.get(chat_chk)then
            chat.print("{lime}[Detail] {violet}你{white}击中了{orange} "..name.." {white}的 {lightred}"..group.."  {white}并造成了：{lime}"..damage.." 伤害{white}| 命中率： {darkblue}"..chance.." {white}| 回溯: {yellow}"..backtrack.." Tick {white}")
        end 
    end
end
client.set_event_callback("aim_hit", aim_hit)

function aim_miss(e)
    if ui.get(hit_log_chk)then
        local r,g,b,a = ui.get(hitlog_color)
        local group = hitgroup_names[e.hitgroup + 1] or "?"
        local name = entity.get_player_name(e.target)
        local damage = e.damage
        if e.reason == "?"then
            reason = "解析"
        elseif e.reason == "spread" then
            reason = "扩散"
        else
            reason = e.reason
        end
        local hp_left = entity.get_prop(e.target, "m_iHealth")
        client.color_log(r,g,b, string.format("[Detail] 你空了 %s 的 %s  因为：%s | 命中率： %s | 回溯: %s Tick | 完全解析: %s", name, group, reason, chance, backtrack, boosted and "是" or "否"))
         if ui.get(chat_chk)then
        chat.print("{red}[Detail] {violet}你{white}空了{orange} "..name.." {white}的 {lightred}"..group.."  {white}因为：{lime}"..reason.." {white}| 命中率： {darkblue}"..chance.." {white}| 回溯: {yellow}"..backtrack.." Tick {white}")
    end 
end
end
client.set_event_callback("aim_miss", aim_miss)

--hitlogs

function hit_ind()
    

local dragging_2 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()




local hk_dragger = dragging_2.new("Resolver Indicators", 500, 400)






local hit_ind_chk = ui.new_checkbox("Config", "Lua", "[Detail] Hit Ind")

hitgroup_names_1 = {"Body", "Head", "Chest", "Stomach", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Neck", "?", "Gear"}
function aim_hit_1(e)
        group = hitgroup_names_1[e.hitgroup + 1] or "?"
        name = entity.get_player_name(e.target)
        damage = e.damage
        hp_left = entity.get_prop(e.target, "m_iHealth")
end
client.set_event_callback("aim_hit", aim_hit_1)



client.set_event_callback("round_start", function()
    name = nil
end)

client.set_event_callback("paint", function(e)
if ui.get(hit_ind_chk)then

	local active_players = 0
	local x, y =  hk_dragger:get()
	local player = entity.get_players(true)
	local weapon_r, weapon_g, weapon_b, weapon_a = color[0], color[1] ,130, 180
	local alpha = 1 + math.sin(math.abs(- math.pi + globals.realtime() % (math.pi * 2))) * 219
	local pulse = 8 + math.sin(math.abs(- math.pi + (globals.realtime() * (0.6 / 1)) % (math.pi * 2))) * 12
	

    if name == nil then
		local addiction_y = 10
		client.draw_gradient(ctx, x + 5, y, 218, 10, 0, 0, 0, 20, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y, 223, 20 + addiction_y, 0, 0, 0, 200, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y - 2, 40 + pulse * 3, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y, pulse * 0.7, 20 + addiction_y, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y + 20 + addiction_y, 120 + pulse * 5, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 20, true)
		renderer.text(x + 10, y + 3, 255, 155, 155, 180, "", 0, "")
		renderer.text(active_players <= 0 and x + 50 or x + 50, y + 3, active_players <= 0 and weapon_r or 255, active_players <= 0 and weapon_g or 155, active_players <= 0 and weapon_b or 155, alpha, "", 0, active_players <= 0 and "[Detail] Hit Indicators" or "[Detail] Hit Indicators")
		renderer.text(x + 155, y + 3, 128, 183, 255, 255, "", 0, "  ")
        renderer.text(x + 50, y + 3+13, color[0],color[1],130, alpha, "", 0, "Waiting For Hit")

	hk_dragger:drag(200, 20 + 10)
    else
        local addiction_y = 60
		client.draw_gradient(ctx, x + 5, y, 218, 10, 0, 0, 0, 20, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y, 223, 20 + addiction_y, 0, 0, 0, 200, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y - 2, 40 + pulse * 3, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y, pulse * 0.7, 20 + addiction_y, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y + 20 + addiction_y, 120 + pulse * 5, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 20, true)
		renderer.text(x + 10, y + 3, 255, 155, 155, 180, "", 0, "")
		renderer.text(active_players <= 0 and x + 50 or x + 50, y + 3, active_players <= 0 and weapon_r or 255, active_players <= 0 and weapon_g or 155, active_players <= 0 and weapon_b or 155, alpha, "", 0, active_players <= 0 and "[Detail] Hit Indicators" or "[Detail] Hit Indicators")
		renderer.text(x + 155, y + 3, 128, 183, 255, 255, "", 0, "  ")
        renderer.text(x + 50, y + 3+13, 0,255,0, 180, "", 0, "Name : "..name)
        renderer.text(x + 50, y + 3+23, 0,255,0, 180, "", 0, "Murderer : "..entity.get_player_name(entity.get_local_player()))
        renderer.text(x + 50, y + 3+33, 0,255,0, 180, "", 0, "Position : "..group)
        renderer.text(x + 50, y + 3+43, 0,255,0, 180, "", 0, "Damage : "..damage)
        renderer.text(x + 50, y + 3+53, 0,255,0, 180, "", 0, "Chance : "..chance.."%")
        renderer.text(x + 50, y + 3+63, 0,255,0, 180, "", 0, "Backtrack : "..backtrack.." Tick")
	hk_dragger:drag(200, 20 + 60)
    end
end
end)
-- 111111 saughter
local function Reset()ui.set(Resetlist,true)death_invert={}antibrute={}tries={}resolved={}high_delta={}Headshot={}side = {}guess_num = {}end




end
hit_ind()


client.set_event_callback("paint_ui", function()
    ui.set_visible(fl_ena_ref, false)
    ui.set_visible(fl_hot_ref, false)
    ui.set_visible(fl_limit_ref, false)
    ui.set_visible(fl_var_ref, false)
    ui.set_visible(fl_amount_ref, false)
end)

client.set_event_callback("shutdown", function()
    ui.set_visible(fl_ena_ref, true)
    ui.set_visible(fl_hot_ref, true)
    ui.set_visible(fl_limit_ref, true)
    ui.set_visible(fl_var_ref, true)
    ui.set_visible(fl_amount_ref, true)
end)

local dt_limit_ref = ui.reference("Rage","Other", "Double tap fake lag limit")
local dt_mode_ref =ui.reference("Rage","Other", "Double tap mode")
local ui_dt_on = ui.new_checkbox("Rage", "Other", "[Detail]Double tap Enabled")
local ui_dt_mode = ui.new_combobox("Rage","Other", "[Detail]Double tap mode","Offensive","Defensive")
client.set_event_callback("setup_command", function()
    ui.set(dt_mode_ref,ui.get(ui_dt_mode))
    ui.set(dt_limit_ref,1)
end)

client.set_event_callback("paint_ui", function()
    ui.set_visible(ui_dt_mode, ui.get(ui_dt_on))
    ui.set_visible(dt_limit_ref, false)
    ui.set_visible(dt_mode_ref, false)
end)

client.set_event_callback("shutdown",function()
    ui.set_visible(dt_limit_ref, true)
    ui.set_visible(dt_mode_ref, true)
    cvar.cl_clock_correction:set_int(1)
end)

function dt_set()
    if ui.get(ui_dt_on)then
        cvar.cl_clock_correction:set_int(0)
    else
        cvar.cl_clock_correction:set_int(1)
    end
end
dt_set()
ui.set_callback(ui_dt_on, dt_set)

local ui_mul = ui.new_multiselect("Config", "Lua","[Detail] UI Connect","Mid.png","HUD.png","warning.png")
client.set_event_callback("paint", function()
    local x,y = client.screen_size()
    if ui.get(ui_mul)[1] == "Mid.png"then
        local id = renderer.load_png(readfile("HUD/Mid.png"), x, y)
        renderer.texture(id, x/2-307/2, y/2-307/2, 307, 307, 255, 255, 255, 255, "f")
    end
    if ui.get(ui_mul)[1] == "HUD.png" or ui.get(ui_mul)[2] == "HUD.png"then
        local id_c = renderer.load_png(readfile("HUD/HUD.png"), x, y)
        renderer.texture(id_c, -70, -30, x*1.1, y*1.1, 255, 255, 255, 120, "f")
    end
    if ui.get(ui_mul)[1] == "warning.png" or ui.get(ui_mul)[2] == "warning.png" or ui.get(ui_mul)[3] == "warning.png"then
        local id_c = renderer.load_png(readfile("HUD/warning.png"), x, y)
        renderer.texture(id_c, x/2-634/2, 130, 634, 51, 255, 255, 255, 255 ,"f")
    end
    local id_1 = renderer.load_png(readfile("HUD/delta_left.png"), x, y)
    local id_2 = renderer.load_png(readfile("HUD/delta_right.png"), x, y)
    renderer.texture(id_1, x/2-755*0.2-120, y/2-307/2+110, 755*0.1, 930*0.1, 255, 255, 255, 255, "f")
    renderer.texture(id_2, x/2+755*0.2+45, y/2-307/2+110, 755*0.1, 930*0.1, 255, 255, 255, 255, "f")
    local yaw,yaw_value = ui.reference("AA", "Anti-aimbot angles", "Yaw")
    if ui.get(yaw_value) == -90 then
        renderer.texture(id_1, x/2-755*0.2-120, y/2-307/2+110, 755*0.1, 930*0.1, 255, 255, 100, 255, "f")
    elseif ui.get(yaw_value) == 90 then
        renderer.texture(id_2, x/2+755*0.2+45, y/2-307/2+110, 755*0.1, 930*0.1, 255, 255, 100, 255, "f")
    end
end)






local aa_ind_chk = ui.new_checkbox("AA", "Anti-aimbot angles", "[Detail] Anti-Aim Ind")
function aa_ind()

local dragging_2 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()




local hk_dragger = dragging_2.new("Resolver Indicators", 300, 600)






local aa_lim_ref = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")

aa_value_tab = {0,0,0,0,0}
client.set_event_callback("setup_command",function()
    if time == 1 then
        time = 2 
    elseif time == 2 then
        time =3 
    elseif time == 3 then
        time = 4 
    elseif time == 4 then
        time = 5 
    elseif time == 5 then
        time = 1 
    end
    aa_value_tab[time] = ui.get(aa_lim_ref)
end)


client.set_event_callback("paint", function(e)
    if ui.get(aa_ind_chk)then

	local active_players = 0
	local x, y =  hk_dragger:get()
	local player = entity.get_players(true)
	local weapon_r, weapon_g, weapon_b, weapon_a = color[0], color[1] ,130, 180
	local alpha = 1 + math.sin(math.abs(- math.pi + globals.realtime() % (math.pi * 2))) * 219
	local pulse = 8 + math.sin(math.abs(- math.pi + (globals.realtime() * (0.6 / 1)) % (math.pi * 2))) * 12
	


		local addiction_y = 70
		client.draw_gradient(ctx, x + 5, y, 218, 10, 0, 0, 0, 20, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y, 223, 20 + addiction_y, 0, 0, 0, 200, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y - 2, 40 + pulse * 3, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y, pulse * 0.7, 20 + addiction_y, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y + 20 + addiction_y, 120 + pulse * 5, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 20, true)
		renderer.text(x + 10, y + 3, 255, 155, 155, 180, "", 0, "")
		renderer.text(active_players <= 0 and x + 50 or x + 50, y + 3, active_players <= 0 and weapon_r or 255, active_players <= 0 and weapon_g or 155, active_players <= 0 and weapon_b or 155, alpha, "", 0, active_players <= 0 and "[Detail] Anti-Aim Indicators" or "[Detail] Anti-Aim Indicators")
		renderer.text(x + 155, y + 3, 128, 183, 255, 255, "", 0, "  ")

        renderer.text(x + 50, y + 3+13, 	255,215,0, 180, "", 0, "Health : "..entity.get_prop(entity.get_local_player(), "m_iHealth").." HP")
		renderer.text(x + 50, y + 3+23, 	255,215,0, 180, "", 0, "History : "..aa_value_tab[1].."-"..aa_value_tab[2].."-"..aa_value_tab[3].."-"..aa_value_tab[4].."-"..aa_value_tab[5])
        renderer.text(x + 50, y + 3+33, 	255,215,0, 180, "", 0, "Pitch : "..ui.get(ui.reference("AA", "Anti-aimbot angles", "Pitch")))
        renderer.text(x + 50, y + 3+43, 	255,215,0, 180, "", 0, "Yaw Base : "..ui.get(ui.reference("AA", "Anti-aimbot angles", "Yaw base")))
        renderer.text(x + 50, y + 3+53, 	255,215,0, 180, "", 0, "Body yaw : "..ui.get(ui.reference("AA", "Anti-aimbot angles", "Body yaw")))
        local gg,zz = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
        local Angle = math.modf(math.min(57, math.abs(entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11)*120-60)))
            renderer.text(x + 50, y + 3+63, 	255,215,0, 180, "", 0, "Fake >> "..Angle.."°")
            renderer.text(x + 50, y + 3+73, 	255,215,0, 180, "", 0, "Mode : "..aa_type[aa])
	hk_dragger:drag(200, 20 + 70)
end
end)
-- 111111 saughter
local function Reset()ui.set(Resetlist,true)death_invert={}antibrute={}tries={}resolved={}high_delta={}Headshot={}side = {}guess_num = {}end

end
aa_ind()


hurt_mode ={"Autowall","Minimum","Airing","Visible"}


local rage_ind_chk = ui.new_checkbox("Rage", "Aimbot", "[Detail] Rage Ind")
function rage_ind()

local dragging_2 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()




local hk_dragger = dragging_2.new("Resolver Indicators", 700, 600)








client.set_event_callback("paint", function(e)
    if ui.get(rage_ind_chk)then

	local active_players = 0
	local x, y =  hk_dragger:get()
	local player = entity.get_players(true)
	local weapon_r, weapon_g, weapon_b, weapon_a = color[0], color[1] ,130, 180
	local alpha = 1 + math.sin(math.abs(- math.pi + globals.realtime() % (math.pi * 2))) * 219
	local pulse = 8 + math.sin(math.abs(- math.pi + (globals.realtime() * (0.6 / 1)) % (math.pi * 2))) * 12
	


		local addiction_y = 90
		client.draw_gradient(ctx, x + 5, y, 218, 10, 0, 0, 0, 20, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y, 223, 20 + addiction_y, 0, 0, 0, 200, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y - 2, 40 + pulse * 3, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y, pulse * 0.7, 20 + addiction_y, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y + 20 + addiction_y, 120 + pulse * 5, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 20, true)
		renderer.text(x + 10, y + 3, 255, 155, 155, 180, "", 0, "")
		renderer.text(active_players <= 0 and x + 50 or x + 50, y + 3, active_players <= 0 and weapon_r or 255, active_players <= 0 and weapon_g or 155, active_players <= 0 and weapon_b or 155, alpha, "", 0, active_players <= 0 and "[Detail] Aimbot Indicators" or "[Detail] Aimbot Indicators")
		renderer.text(x + 155, y + 3, 128, 183, 255, 255, "", 0, "  ")
        if entity.is_alive(entity.get_local_player())then
            we = entity.get_classname(entity.get_player_weapon(entity.get_local_player()))
        else
            we = "DIE"
        end
        renderer.text(x + 50, y + 3+13, 255,192,203, 180, "", 0, "Weapon : "..we)
        renderer.text(x + 50, y + 3+23, 255,192,203, 180, "", 0, "Hit Chance : "..ui.get(ui.reference("Rage", "Aimbot", "Minimum hit chance")).."%")
        renderer.text(x + 50, y + 3+33, 255,192,203, 180, "", 0, "Damage : "..ui.get(ui.reference("Rage", "Aimbot", "Minimum damage")))
        renderer.text(x + 50, y + 3+43, 255,192,203, 180, "", 0, "Multi-point Scale : "..ui.get(ui.reference("Rage", "Aimbot", "Multi-point scale")).."%")
        renderer.text(x + 50, y + 3+53, 255,192,203, 180, "", 0, "Accuracy Boost : "..ui.get(ui.reference("Rage", "Other", "Accuracy boost")))
        renderer.text(x + 50, y + 3+63, 255,192,203, 180, "", 0, "Target selection : "..ui.get(ui.reference("Rage", "Aimbot", "Target selection")))
        renderer.text(x + 50, y + 3+73, 255,192,203, 180, "", 0, "Maximum FOV : "..ui.get(ui.reference("Rage", "Aimbot", "Maximum FOV")).."°")
        renderer.text(x + 50, y + 3+83, 255,192,203, 180, "", 0, "Mode : "..hurt_mode[hurt_damage+1])
        if ui.get(ui.reference("Rage", "Other","Delay shot")) then
        renderer.text(x + 50, y + 3+93, 255,192,203, 180, "", 0, "Delay Shot : ".."True")
        else
            renderer.text(x + 50, y + 3+93, 255,192,203, 180, "", 0, "Delay Shot : ".."False")
        end

	hk_dragger:drag(200, 20 + 90)
end
end)
-- 111111 saughter
local function Reset()ui.set(Resetlist,true)death_invert={}antibrute={}tries={}resolved={}high_delta={}Headshot={}side = {}guess_num = {}end

end
rage_ind()


local low_by = ui.new_checkbox("AA", "Anti-aimbot angles","[Detail] Lower Body Yaw Enabled")
client.set_event_callback("setup_command", function(cmd)
    local gg,zz = ui.reference("AA", "Anti-aimbot angles", "Yaw")
    local function nt()
        local value = entity.get_prop(entity.get_local_player(), "m_fFlags")
        if value == 263 or value == 261 then
            return true
        else
            return false
        end
    end
    if ui.get(low_by) and ui.get(zz)==180 and nt() then
    cmd.forwardmove = 0.000000000000000000000000000000001
    cmd.in_forward = 1
    end
end)









local images = require 'gamesense/images'
local csgo_weapons = require 'gamesense/csgo_weapons'





local po_ind = ui.new_checkbox("Config", "Lua", "[Detail] UI Indicators")
function ui_ind()

    local dragging_2 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()
    
    
    
    
    local hk_dragger = dragging_2.new("Resolver Indicators", 300, 600)
    
    
    
    
    
    

    
    client.set_event_callback("paint", function(e)
        if ui.get(po_ind)then

    
        local active_players = 0
        local x, y =  hk_dragger:get()
        local player = entity.get_players(true)
        local weapon_r, weapon_g, weapon_b, weapon_a = color[0], color[1] ,130, 180
        local alpha = 1 + math.sin(math.abs(- math.pi + globals.realtime() % (math.pi * 2))) * 219
        local pulse = 8 + math.sin(math.abs(- math.pi + (globals.realtime() * (0.6 / 1)) % (math.pi * 2))) * 12
        local user = ""
local frametimes = { }
local fps_prev = 0
local last_update_time = 0
        local function AccumulateFps()
            local ft = globals.absoluteframetime()
            if ft > 0 then
                table.insert(frametimes, 1, ft)
            end
            local count = #frametimes
            if count == 0 then
                return 0
            end
            local i, accum = 0, 0
            while accum < 0.5 do
                i = i + 1
                accum = accum + frametimes[i]
                if i >= count then
                    break
                end
            end
            accum = accum / i
            while i < count do
                i = i + 1
                table.remove(frametimes)
            end
            local fps = 1 / accum
            local rt = globals.realtime()
            if math.abs(fps - fps_prev) > 4 or rt - last_update_time > 2 then
                fps_prev = fps
                last_update_time = rt
            else
                fps = fps_prev
            end
            return math.floor(fps + 0.5)
        end
        local fps = AccumulateFps()
    
    
            local id_c = renderer.load_png(readfile("HUD/book ind.png"), x, y)
            renderer.texture(id_c, x, y, 320, 320, 255, 255, 255, 200 ,"f")
            renderer.text(x+160, y+45, color[0], color[1], color[3], alpha, "c+",0,"Detail Indicators")
            renderer.text(x+30, y+65, 255, 255, 255, 255, "+",0,"FL")
            renderer.rectangle(x+80, y+71, 170, 18, 128,128,128, 120)
            renderer.rectangle(x+80, y+71, 170*(ui.get(fl_limit_ref)/17), 18, 0,255,255, 180)
            renderer.text(x+260, y+65, 255, 255, 255, 255, "+",0,ui.get(fl_limit_ref))

            renderer.text(x+30, y+85, 255, 255, 255, 255, "+",0,"FPS")
            renderer.rectangle(x+80, y+91, 170, 18, 128,128,128, 120)
            renderer.rectangle(x+80, y+91, 170*(fps/350), 18, 0,255,255, 180)
            renderer.text(x+260, y+85, 255, 255, 255, 255, "+",0,fps)


            local vec = entity.get_prop(entity.get_local_player(),  "m_vecVelocity[0]")
    local vec_1 = entity.get_prop(entity.get_local_player(),  "m_vecVelocity[1]")
    local speed  = math.modf(math.sqrt(vec*vec+vec_1*vec_1))
    if speed ==1 then
        speed =0
    end
            renderer.text(x+30, y+105, 255, 255, 255, 255, "+",0,"SPD")
            renderer.rectangle(x+80, y+111, 170, 18, 128,128,128, 120)
            renderer.rectangle(x+80, y+111, 170*(speed/350), 18, 0,255,255, 180)
            renderer.text(x+260, y+105, 255, 255, 255, 255, "+",0,speed)

            local Angle = math.modf(math.min(57, math.abs(entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11)*120-60)))
            renderer.text(x+30, y+125, 255, 255, 255, 255, "+",0,"FAK")
            renderer.rectangle(x+80, y+131, 170, 18, 128,128,128, 120)
            renderer.rectangle(x+80, y+131, 170*(Angle/60), 18, 0,255,255, 180)
            renderer.text(x+260, y+125, 255, 255, 255, 255, "+",0,Angle.."°")

            local hp = entity.get_prop(entity.get_local_player(), "m_iHealth")
            renderer.text(x+30, y+145, 255, 255, 255, 255, "+",0,"HP")
            renderer.rectangle(x+80, y+151, 170, 18, 128,128,128, 120)
            renderer.rectangle(x+80, y+151, 170*(hp/100), 18, 0,255,255, 180)
            renderer.text(x+260, y+145, 255, 255, 255, 255, "+",0,hp)


            local c = hit + miss
            renderer.text(x+30, y+165, 255, 255, 255, 255, "+",0,"HIT")
            renderer.rectangle(x+80, y+171, 170, 18, 128,128,128, 120)
            if c ~= 0 then
            renderer.rectangle(x+80, y+171, 170*(hit/c), 18, 0,255,255, 180)
            local z = hit / c
            renderer.rectangle(x+80+170*(hit/c), y+171, 170*(1-z), 18, 255,0,0, 180)
            renderer.text(x+260, y+165, 255, 255, 255, 255, "+",0,math.modf(z*100).."%")
            else
                renderer.rectangle(x+80, y+171, 170*0, 18, 0,255,255, 180)
                renderer.text(x+260, y+165, 255, 255, 255, 255, "+",0,"0%")
            end

            local bomb = entity.get_all("CPlantedC4")
            if bomb ~= nil and #bomb > 0 then
                for key, value in pairs(bomb) do
                    if bomb_zz ~= 0 then
                        bomb_time = 0
                    else
                    bomb_time = entity.get_prop(bomb[key], "m_flC4Blow") - globals.curtime()
                    end
                end
            else
                bomb_time = 0
            end
            local r8 = bomb_time /40
            if begin == 0 then
                renderer.text(x+30, y+185, 255, 255, 255, 255, "+",0,"C4")
                renderer.rectangle(x+80, y+191, 170, 18, 128,128,128, 120)
                renderer.rectangle(x+80, y+191, 170*r8, 18, 0,255,255, 180)
                renderer.text(x+260, y+185, 255, 255, 255, 255, "+",0,math.modf(bomb_time).."s")
            else
                renderer.text(x+30, y+185, 255, 255, 255, 255, "+",0,"C4")
                renderer.rectangle(x+80, y+191, 170, 18, 128,128,128, 120)
                renderer.rectangle(x+80, y+191, 170*r8, 18, 255,0,0, 180)
                renderer.text(x+260, y+185, 255, 255, 255, 255, "+",0,math.modf(bomb_time).."s")
            end
            local local_player = entity.get_local_player()
    if entity.is_alive(local_player)then
    local weapon_ent = entity.get_player_weapon(local_player)
    local weapon_idx = entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")
	local weapon = csgo_weapons[weapon_idx]
    local weapon_icon = images.get_weapon_icon(weapon.console_name)
    weapon_icon:draw(x+140, y+220,weapon_icon.width,weapon_icon.height, 0, 191, 255, 120,false, "f")
    end

        hk_dragger:drag(320, 320)
        end
    end)
    -- 111111 saughter
    local function Reset()ui.set(Resetlist,true)death_invert={}antibrute={}tries={}resolved={}high_delta={}Headshot={}side = {}guess_num = {}end
    
    end
ui_ind()

hit = 0 
miss = 0 
client.set_event_callback("aim_hit", function()
    hit = hit + 1
end)

client.set_event_callback("aim_miss", function()
    miss = miss + 1 
end)
client.set_event_callback("game_end", function()
    hit= 0
    miss = 0
end)



bomb_zz = 0
begin = 0
client.set_event_callback("bomb_begindefuse", function()
    begin = 1
end)

client.set_event_callback("bomb_abortdefuse", function()
    begin = 0
end)

client.set_event_callback("bomb_exploded",function()
    bomb_zz = 1 
    client.delay_call(18, function()
        bomb_zz = 0
    end)
end)

client.set_event_callback("bomb_defused", function()
    bomb_zz = 1 
    client.delay_call(18, function()
        bomb_zz = 0
    end)
end)

local slow_walk_type_ref = ui.reference("AA", "Other", "Slow motion type")
local slow_walk_leg_ref = ui.reference("AA", "Other", "Leg movement")

local slow_walk_type = ui.new_combobox("AA", "Other", "[Detail]Slow motion type","Favor anti-aim","Favor high speed","Custom Speed")
local cus_speed = ui.new_slider("AA", "Other", "[Detail]Custom Slow Walk Speed", 1, 9,5)
client.set_event_callback("paint_ui", function()
    if ui.get(slow_walk_type)~="Custom Speed"then
    ui.set_visible(cus_speed, false)
    else
        ui.set_visible(cus_speed, true)
    end
end)

client.set_event_callback("setup_command",function()
    if ui.get(slow_walk_type)~="Custom Speed"then
        ui.set(slow_walk_type_ref,ui.get(slow_walk_type))
    else
        local random = client.random_int(0, 10)
        if random > ui.get(cus_speed)then
            ui.set(slow_walk_type_ref,"Favor anti-aim")
        else
            ui.set(slow_walk_type_ref,"Favor high speed")
        end
    end
end)

local slow_walk_mode = ui.new_combobox("AA", "Other", "[Detail]Leg Movement Mode","Off","Always slide","Never lide","Both","Back slide","Jitter slide")
client.set_event_callback("setup_command", function()
    if ui.get(slow_walk_mode)~="Both" and ui.get(slow_walk_mode)~="Back slide" and ui.get(slow_walk_mode)~="Jitter slide" then
        ui.set(slow_walk_leg_ref,ui.get(slow_walk_mode))
    elseif ui.get(slow_walk_mode)=="Both" then
        local random = client.random_int(0, 10)
        if random > 5 then
            ui.set(slow_walk_leg_ref,"Always slide")
        else
            ui.set(slow_walk_leg_ref,"Never slide")
        end
    elseif ui.get(slow_walk_mode)=="Back slide" then
        local random = client.random_int(0, 10)
        if random > 5 then
            ui.set(slow_walk_leg_ref,"Always slide")
        else
            ui.set(slow_walk_leg_ref,"Never slide")
        end
    else
        local p = client.random_int(1, 3)
        if p == 1 then
            ui.set(slow_walk_leg_ref, "Off")
        elseif p == 2 then
           ui.set(slow_walk_leg_ref, "Always slide")
        elseif p == 3 then
            ui.set(slow_walk_leg_ref, "Off")
        end
    end
end)


client.set_event_callback("net_update_end", function()
    if ui.get(slow_walk_mode)=="Back slide" or ui.get(slow_walk_mode)=="Jitter slide"then
    entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 0)
    end
end)

client.set_event_callback("paint_ui", function()
    ui.set_visible(slow_walk_type_ref, false)
    ui.set_visible(slow_walk_leg_ref, false)
end)

client.set_event_callback("shutdown", function()
    ui.set_visible(slow_walk_type_ref, true)
    ui.set_visible(slow_walk_leg_ref, true)
end)



local res_chk = ui.new_checkbox("Misc", "Miscellaneous", "[Detail] Resolver")
function res()
    

local dragging_2 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()

local td = {}
function ss()
	for i = 1 , 20 do
		td[i] = client.random_int(-30, 30)
	end
	client.delay_call(5, ss)
end
ss()




local hk_dragger = dragging_2.new("Resolver Indicators", 900, 600)



client.set_event_callback("paint_ui", function(e)
    if ui.get(res_chk)then

	local active_players = 0
	local x, y =  hk_dragger:get()
	local player = entity.get_players(true)
    local weapon_r, weapon_g, weapon_b, weapon_a = color[0], color[1] ,130, 180
	local alpha = 1 + math.sin(math.abs(- math.pi + globals.realtime() % (math.pi * 2))) * 219
	local pulse = 8 + math.sin(math.abs(- math.pi + (globals.realtime() * (0.6 / 1)) % (math.pi * 2))) * 12
	

		for i = 1, #player do
			if plist.get(player[i], "Force body yaw") or plist.get(player[i], "Override prefer body aim") == "Off" or plist.get(player[i], "Override safe point") == "Off" then
				active_players = active_players + 1
			end
		end

		local addiction_y = (#player * 10)
		client.draw_gradient(ctx, x + 5, y, 218, 10, 0, 0, 0, 20, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y, 223, 20 + addiction_y, 0, 0, 0, 200, 10, 10, 10, 30, true)
		client.draw_gradient(ctx, x, y - 2, 40 + pulse * 3, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y, pulse * 0.7, 20 + addiction_y, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 5, true)
		client.draw_gradient(ctx, x, y + 20 + addiction_y, 120 + pulse * 5, 2, weapon_r, weapon_g, weapon_b, 255, 25, 25, 25, 20, true)
		renderer.text(x + 10, y + 3, 0, 255, 255, alpha, "", 0, "Detail")
		renderer.text(active_players <= 0 and x + 80 or x + 85, y + 3, active_players <= 0 and weapon_r or 255, active_players <= 0 and weapon_g or 155, active_players <= 0 and weapon_b or 155, alpha, "", 0, active_players <= 0 and "WAITING" or "ACTIVE")
		renderer.text(x + 155, y + 3, 0, 255, 255, alpha, "", 0, "   Resolver")

	for i = 1, #player do
		local enemys = player[i]
		local jiaodu = plist.get(enemys, "Force body yaw value")
		if #player >= 1 then
			local Angle = math.modf(math.min(60, math.abs(entity.get_prop(enemys, "m_flPoseParameter", 11)*120-60)))
			if Angle > 10 then
				plist.set(enemys, "Force body yaw",true)
			else
				plist.set(enemys, "Force body yaw",false)
			end
		if td[i] >= 0 then
			plist.set(enemys, "Force body yaw value",Angle)
			else
				plist.set(enemys, "Force body yaw value",0 - Angle)
			end
			plist.set(enemys, "Correction active",false)
			renderer.text(x + 10, y + 5 + (i * 10), 255, 155, 155, 180, "", 0, i)
			renderer.text(x + 25, y + 5 + (i * 10), 255, 155, 155, 180, "", 0, "Target: ")
			renderer.text(x + 65, y + 5 + (i * 10), 215, 155, 155, 210, "", 0, entity.get_player_name(enemys))
			renderer.text(x + 148, y + 5 + (i * 10), plist.get(enemys, "Force body yaw") and 255 or 0, plist.get(enemys, "Force body yaw") and 0 or 255, 0, 255, "", 0, "● ")
			renderer.text(x + 156, y + 5 + (i * 10), plist.get(enemys, "Force body yaw") and 255 or weapon_r, plist.get(enemys, "Force body yaw") and 155 or weapon_g, plist.get(enemys, "Force body yaw") and 155 or weapon_b, plist.get(enemys, "Force body yaw") and 180 or (weapon_a / 255) * alpha, "", 0, plist.get(enemys, "Force body yaw") and "Resolver" or "Waiting"," [",jiaodu,"°]" )
		end
	end

	hk_dragger:drag(200, 20 + #player * 10)

else
    local player = entity.get_players(true)
    if player ~= nil then
        for i = 1, #player do
            plist.set(player[i], "Force body yaw", false)
            plist.set(player[i], "Force body yaw value", 0)
        end
    end
end
end)
-- 111111 saughter
local function Reset()ui.set(Resetlist,true)death_invert={}antibrute={}tries={}resolved={}high_delta={}Headshot={}side = {}guess_num = {}end

client.set_event_callback("aim_miss", function(e)
    if ui.get(res_chk)then
	local name = e.target
	local value = plist.get(name, "Force body yaw value")
	if value >= 0 then
		client.color_log(255, 0, 255, "[Detail]对 "..entity.get_player_name(name).." 的角度解析失败，错误角度"..plist.get(name, "Force body yaw value").."°, 预测角度 "..client.random_int(-37, -16).."°")
	else
		client.color_log(255, 0, 255, "[Detail]对 "..entity.get_player_name(name).." 的角度解析失败，错误角度"..plist.get(name, "Force body yaw value").."°, 预测角度 "..client.random_int(14, 42).."°")
	end
end
end)

client.set_event_callback("aim_hit", function(e)
    if ui.get(res_chk)then
	local name_1 = e.target
	client.color_log(0,191,255 ,"[Detail]对 "..entity.get_player_name(name_1).." 的角度解析成功，角度"..plist.get(name_1, "Force body yaw value").."°")
    end
end)


end
res()

local aa_ena_ref = ui.reference("AA", "Anti-aimbot angles", "Enabled")
local aa_pitch_ref = ui.reference("AA", "Anti-aimbot angles", "Pitch")
local aa_yaw_base_ref =ui.reference("AA", "Anti-aimbot angles", "Yaw base")
local aa_yaw_ref,aa_slider_ref = ui.reference("AA", "Anti-aimbot angles", "Yaw")
local aa_yaw_jitter_ref,aa_yaw_jitter_slider_ref = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")
local aa_body_yaw_ref,aa_body_yaw_slider_ref = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
local aa_fake_yaw_limit_ref  = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local aa_freestanding_body_yaw_ref = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
local aa_edge_yaw_ref = ui.reference("AA", "Anti-aimbot angles", "Edge yaw")
local aa_freestanding_ref,aa_freestanding_1_ref = ui.reference("AA", "Anti-aimbot angles", "Freestanding")





aa_type = {"Crouching","Airing","Slow Walking","Moving","Freestanding","Legit"}

local ui_aa_mode = ui.new_combobox("AA", "Anti-aimbot angles", "[Detail] AA Mode",aa_type[1],aa_type[2],aa_type[3],aa_type[4],aa_type[5],aa_type[6])
local ui_aa_free = ui.new_multiselect("AA", "Anti-aimbot angles", "[Detail] Freestanding", "Default")
local ui_aa_edge = ui.new_checkbox("AA", "Anti-aimbot angles", "[Detail]Edge yaw")
local ui_aa_by = ui.new_checkbox("AA", "Anti-aimbot angles", "[Detail]Freestanding body yaw")
client.set_event_callback("setup_command", function()
    ui.set(aa_freestanding_ref,ui.get(ui_aa_free))
    ui.set(aa_edge_yaw_ref,ui.get(ui_aa_edge))
    ui.set(aa_freestanding_body_yaw_ref,ui.get(ui_aa_by))
    if ui.get(ui_aa_free)[1] == "Default"then
        ui.set(aa_freestanding_1_ref,"Always on")
    else
        ui.set(aa_freestanding_1_ref,"On hotkey")
    end
end)
local left_right = ui.new_combobox("AA", "Anti-aimbot angles", "[Detail] AA Position","Force Right","Force Left","Auto Change","Time Change")
local time_2 = ui.new_slider("AA", "Anti-aimbot angles", "[Detail]Time Change Position", 30, 100, 10, true, "s", 0.1)
client.set_event_callback("paint_ui", function()
    if ui.get(left_right) == "Time Change"then
    ui.set_visible(time_2, true)
    else
        ui.set_visible(time_2, false)
    end
end)

function set_pos()
    if ui.get(left_right) == "Time Change"then
        we_pos = client.random_int(1, 2)
    end
    client.delay_call(ui.get(time_2)/10, set_pos)
end
set_pos()

we_pos = 1
client.set_event_callback("weapon_fire", function()
    if ui.get(left_right) == "Auto Change"then
    if we_pos == 1 then
        we_pos = 2
    else
        we_pos = 1
    end 
end
end)

aa_pos = 1
client.set_event_callback("setup_command", function()
    if ui.get(left_right) == "Force Right"then--right
        aa_pos = 1
    elseif ui.get(left_right) == "Force Left"then--Left
        aa_pos = 2
    else
        aa_pos = we_pos
    end
end)

local aa_legit = ui.new_hotkey("AA", "Anti-aimbot angles", "[Detail]Legit AA")
local aa_left = ui.new_hotkey("AA", "Anti-aimbot angles", "[Detail]Left AA")
local aa_right = ui.new_hotkey("AA", "Anti-aimbot angles", "[Detail]Right AA")
local aa_default = ui.new_hotkey("AA", "Anti-aimbot angles", "[Detail]Default AA")

client.set_event_callback("paint_ui", function()
    ui.set(aa_ena_ref,true)
    ui.set(aa_yaw_ref,"180")
end)

pos = 0
client.set_event_callback("setup_command", function()
    if ui.get(aa_left) then
        pos = 1 
    elseif ui.get(aa_right)then
        pos = 2 
    elseif ui.get(aa_default)then
        pos = 0
    end
end)

client.set_event_callback("setup_command", function()
    if aa ~= 6 then
        ui.set(aa_pitch_ref,"Default")
        if pos == 1 then
            ui.set(aa_yaw_base_ref,"Local view")
            ui.set(aa_slider_ref,-90)
        elseif pos == 2 then
            ui.set(aa_yaw_base_ref,"Local view")
            ui.set(aa_slider_ref,90)
        elseif pos == 0 then
            ui.set(aa_yaw_base_ref,"At targets")
        end
    else
        ui.set(aa_pitch_ref,"Off")
        ui.set(aa_yaw_base_ref,"Local view")
        ui.set(aa_slider_ref,180)
    end
end)



client.set_event_callback("paint_ui", function()
    ui.set(aa_left, "On hotkey")
    ui.set(aa_right, "On hotkey")
    ui.set(aa_default, "On hotkey")
end)


local aa_chose = ui.new_combobox("AA","Anti-aimbot angles", "[Detail] AA Position UI Visible", "Left","Right")
aa_name ={}
function aa_ui_add()
    for i = 1 , #aa_type do
        aa_name[i]={
            ["yaw_min"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."] Yaw Minimum", -180, 180, 0, true, "°"),
            ["yaw_max"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."] Yaw Maximum", -180, 180, 0, true, "°"),
            ["jitter_mode"] = ui.new_combobox("AA","Anti-aimbot angles", "["..aa_type[i].."] Yaw Jitter Mode","Off","Offset","Center","Random"),
            ["yaw_jitter_min_left"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Left Yaw Jitter Minimum", -180, 180, 0, true, "°"),
            ["yaw_jitter_max_left"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Left Yaw Jitter Maximum", -180, 180, 0, true, "°"),
            ["yaw_jitter_min_right"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Right Yaw Jitter Minimum", -180, 180, 0, true, "°"),
            ["yaw_jitter_max_right"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Right Yaw Jitter Maximum", -180, 180, 0, true, "°"),
            ["body_yaw_mode"] = ui.new_combobox("AA","Anti-aimbot angles", "["..aa_type[i].."] Body Yaw Mode","Off","Opposite","Jitter","Static"),
            ["body_yaw_min_left"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Left Body Yaw Minimum", -180, 0, -180, true, "°"),
            ["body_yaw_max_left"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Left Body Yaw Maximum", -180, 0, -180, true, "°"),
            ["body_yaw_min_right"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Right Body Yaw Minimum", 0, 180, 180, true, "°"),
            ["body_yaw_max_right"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Right Body Yaw Maximum", 0, 180, 180, true, "°"),

            ["fake_limit_fixed_left"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Left Fake Yaw Limit Fixed", 0, 60, 0, true, "°"),
            ["fake_limit_min_left"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Left Fake Yaw Limit Minimum", 0, 60, 0, true, "°"),
            ["fake_limit_max_left"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Left Fake Yaw Limit Maximum", 0, 60, 0, true, "°"),

            ["fake_limit_fixed_right"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Right Fake Yaw Limit Fixed", 0, 60, 0, true, "°"),
            ["fake_limit_min_right"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Right Fake Yaw Limit Minimum", 0, 60, 0, true, "°"),
            ["fake_limit_max_right"]= ui.new_slider("AA","Anti-aimbot angles", "["..aa_type[i].."]Right Fake Yaw Limit Maximum", 0, 60, 0, true, "°"),
        }
    end
end
aa_ui_add()

client.set_event_callback("paint_ui", function()
    for i = 1 , #aa_type do
        if ui.get(ui_aa_mode)==aa_type[i] then
            for k = 1 , i -1 do
               ui.set_visible(aa_name[k]["yaw_min"], false)
               ui.set_visible(aa_name[k]["yaw_max"], false)
               ui.set_visible(aa_name[k]["jitter_mode"], false)
               ui.set_visible(aa_name[k]["yaw_jitter_min_left"], false)
               ui.set_visible(aa_name[k]["yaw_jitter_max_left"], false)
               ui.set_visible(aa_name[k]["yaw_jitter_min_right"], false)
               ui.set_visible(aa_name[k]["yaw_jitter_max_right"], false)
               ui.set_visible(aa_name[k]["body_yaw_mode"], false)
               ui.set_visible(aa_name[k]["body_yaw_min_left"], false)
               ui.set_visible(aa_name[k]["body_yaw_max_left"], false)
               ui.set_visible(aa_name[k]["body_yaw_min_right"], false)
               ui.set_visible(aa_name[k]["body_yaw_max_right"], false)
               ui.set_visible(aa_name[k]["fake_limit_fixed_left"], false)
               ui.set_visible(aa_name[k]["fake_limit_min_left"], false)
               ui.set_visible(aa_name[k]["fake_limit_max_left"], false)
               ui.set_visible(aa_name[k]["fake_limit_fixed_right"], false)
               ui.set_visible(aa_name[k]["fake_limit_min_right"], false)
               ui.set_visible(aa_name[k]["fake_limit_max_right"], false)
            end
            for c = i+1 , #aa_type do
                ui.set_visible(aa_name[c]["yaw_min"], false)
                ui.set_visible(aa_name[c]["yaw_max"], false)
                ui.set_visible(aa_name[c]["jitter_mode"], false)
                ui.set_visible(aa_name[c]["yaw_jitter_min_left"], false)
                ui.set_visible(aa_name[c]["yaw_jitter_max_left"], false)
                ui.set_visible(aa_name[c]["yaw_jitter_min_right"], false)
                ui.set_visible(aa_name[c]["yaw_jitter_max_right"], false)
                ui.set_visible(aa_name[c]["body_yaw_mode"], false)
                ui.set_visible(aa_name[c]["body_yaw_min_left"], false)
                ui.set_visible(aa_name[c]["body_yaw_max_left"], false)
                ui.set_visible(aa_name[c]["body_yaw_min_right"], false)
                ui.set_visible(aa_name[c]["body_yaw_max_right"], false)
                ui.set_visible(aa_name[c]["fake_limit_fixed_left"], false)
                ui.set_visible(aa_name[c]["fake_limit_min_left"], false)
                ui.set_visible(aa_name[c]["fake_limit_max_left"], false)
                ui.set_visible(aa_name[c]["fake_limit_fixed_right"], false)
                ui.set_visible(aa_name[c]["fake_limit_min_right"], false)
                ui.set_visible(aa_name[c]["fake_limit_max_right"], false)
            end
            if ui.get(aa_chose)=="Left"then
            ui.set_visible(aa_name[i]["yaw_min"], true)
            ui.set_visible(aa_name[i]["yaw_max"], true)
            ui.set_visible(aa_name[i]["jitter_mode"], true)
            ui.set_visible(aa_name[i]["yaw_jitter_min_left"], true)
            ui.set_visible(aa_name[i]["yaw_jitter_max_left"], true)
            ui.set_visible(aa_name[i]["yaw_jitter_min_right"], false)
            ui.set_visible(aa_name[i]["yaw_jitter_max_right"], false)
            ui.set_visible(aa_name[i]["body_yaw_mode"], true)
            ui.set_visible(aa_name[i]["body_yaw_min_left"], true)
            ui.set_visible(aa_name[i]["body_yaw_max_left"], true)
            ui.set_visible(aa_name[i]["body_yaw_min_right"], false)
            ui.set_visible(aa_name[i]["body_yaw_max_right"], false)
            ui.set_visible(aa_name[i]["fake_limit_fixed_left"], true)
            ui.set_visible(aa_name[i]["fake_limit_min_left"], true)
            ui.set_visible(aa_name[i]["fake_limit_max_left"], true)
            ui.set_visible(aa_name[i]["fake_limit_fixed_right"], false)
            ui.set_visible(aa_name[i]["fake_limit_min_right"], false)
            ui.set_visible(aa_name[i]["fake_limit_max_right"], false)
            else
                ui.set_visible(aa_name[i]["yaw_min"], true)
                ui.set_visible(aa_name[i]["yaw_max"], true)
                ui.set_visible(aa_name[i]["jitter_mode"], true)
                ui.set_visible(aa_name[i]["yaw_jitter_min_left"], false)
                ui.set_visible(aa_name[i]["yaw_jitter_max_left"], false)
                ui.set_visible(aa_name[i]["yaw_jitter_min_right"], true)
                ui.set_visible(aa_name[i]["yaw_jitter_max_right"], true)
                ui.set_visible(aa_name[i]["body_yaw_mode"], true)
                ui.set_visible(aa_name[i]["body_yaw_min_left"], false)
                ui.set_visible(aa_name[i]["body_yaw_max_left"], false)
                ui.set_visible(aa_name[i]["body_yaw_min_right"], true)
                ui.set_visible(aa_name[i]["body_yaw_max_right"], true)
                ui.set_visible(aa_name[i]["fake_limit_fixed_left"], false)
                ui.set_visible(aa_name[i]["fake_limit_min_left"], false)
                ui.set_visible(aa_name[i]["fake_limit_max_left"], false)
                ui.set_visible(aa_name[i]["fake_limit_fixed_right"], true)
                ui.set_visible(aa_name[i]["fake_limit_min_right"], true)
                ui.set_visible(aa_name[i]["fake_limit_max_right"], true)
            end
        end
    end
end)

function set_random(x,y,z)
    local random =client.random_int(0, 10)
    if random > 5 then
        return x 
    else
        return client.random_int(y, z)
    end
end




client.set_event_callback("setup_command", function()
    if aa ~= 6 and pos == 0 then
    ui.set(aa_slider_ref,client.random_int(ui.get(aa_name[aa]["yaw_min"]), ui.get(aa_name[aa]["yaw_max"])))
    end
    ui.set(aa_yaw_jitter_ref,ui.get(aa_name[aa]["jitter_mode"]))
    ui.set(aa_body_yaw_ref,ui.get(aa_name[aa]["body_yaw_mode"]))
    if aa_pos == 1 then--right
        ui.set(aa_yaw_jitter_slider_ref,client.random_int(ui.get(aa_name[aa]["yaw_jitter_min_right"]), ui.get(aa_name[aa]["yaw_jitter_max_right"])))
        ui.set(aa_body_yaw_slider_ref,client.random_int(ui.get(aa_name[aa]["body_yaw_min_right"]), ui.get(aa_name[aa]["body_yaw_max_right"])))
        if aa_1 ~= 7 then
        ui.set(aa_fake_yaw_limit_ref,set_random(ui.get(aa_name[aa]["fake_limit_fixed_right"]),ui.get(aa_name[aa]["fake_limit_min_right"]),ui.get(aa_name[aa]["fake_limit_max_right"])))
        else
            ui.set(aa_fake_yaw_limit_ref,60)
        end
    else
        ui.set(aa_yaw_jitter_slider_ref,client.random_int(ui.get(aa_name[aa]["yaw_jitter_min_left"]), ui.get(aa_name[aa]["yaw_jitter_max_left"])))
        ui.set(aa_body_yaw_slider_ref,client.random_int(ui.get(aa_name[aa]["body_yaw_min_left"]), ui.get(aa_name[aa]["body_yaw_max_left"])))
        if aa_1 ~= 7 then
            ui.set(aa_fake_yaw_limit_ref,set_random(ui.get(aa_name[aa]["fake_limit_fixed_left"]),ui.get(aa_name[aa]["fake_limit_min_left"]),ui.get(aa_name[aa]["fake_limit_max_left"])))
        else
            ui.set(aa_fake_yaw_limit_ref,60)
        end
    end
end)

client.set_event_callback('paint_ui', function()
    ui.set_visible(aa_ena_ref, false)
    ui.set_visible(aa_pitch_ref, false)
    ui.set_visible(aa_yaw_ref, false)
    ui.set_visible(aa_slider_ref, false)
    ui.set_visible(aa_yaw_base_ref, false)
    ui.set_visible(aa_yaw_jitter_ref, false)
    ui.set_visible(aa_yaw_jitter_slider_ref, false)
    ui.set_visible(aa_body_yaw_ref, false)
    ui.set_visible(aa_body_yaw_slider_ref, false)
    ui.set_visible(aa_edge_yaw_ref, false)
    ui.set_visible(aa_freestanding_1_ref, false)
    ui.set_visible(aa_freestanding_body_yaw_ref, false)
    ui.set_visible(aa_freestanding_ref, false)
    ui.set_visible(aa_fake_yaw_limit_ref, false)
end)

client.set_event_callback("shutdown", function()
    ui.set_visible(aa_ena_ref, true)
    ui.set_visible(aa_pitch_ref, true)
    ui.set_visible(aa_yaw_ref, true)
    ui.set_visible(aa_slider_ref, true)
    ui.set_visible(aa_yaw_base_ref, true)
    ui.set_visible(aa_yaw_jitter_ref, true)
    ui.set_visible(aa_yaw_jitter_slider_ref, true)
    ui.set_visible(aa_body_yaw_ref, true)
    ui.set_visible(aa_body_yaw_slider_ref, true)
    ui.set_visible(aa_edge_yaw_ref, true)
    ui.set_visible(aa_freestanding_1_ref, true)
    ui.set_visible(aa_freestanding_body_yaw_ref, true)
    ui.set_visible(aa_freestanding_ref, true)
    ui.set_visible(aa_fake_yaw_limit_ref, true)
end)


 aa = 5
 aa_1 = 6
client.set_event_callback("setup_command", function()
    local sl_ref,sl_hot_ref =ui.reference("AA", "Other", "Slow motion")
    local value = entity.get_prop(entity.get_local_player(), "m_fFlags")
    local vec = entity.get_prop(entity.get_local_player(),  "m_vecVelocity[0]")
    local vec_1 = entity.get_prop(entity.get_local_player(),  "m_vecVelocity[1]")
    local speed  = math.modf(math.sqrt(vec*vec+vec_1*vec_1))
    if ui.get(aa_legit)then
        aa = 6
        if value == 263 then
            aa_1 = 7
        else
            aa_1 = 6
        end
    elseif value == 263 or value == 261 then
        aa = 1
        aa_1 = 6
    elseif value == 256 or value == 262 then
        aa = 2
        aa_1 = 6
    elseif ui.get(sl_ref) and ui.get(sl_hot_ref)then
        aa = 3
        aa_1 = 6
    elseif speed > 10 then
        aa = 4
        aa_1 = 6
    elseif speed < 10 then
        aa = 5
        aa_1 = 6
    end
end)

ui.new_button("Config", "Presets", "Clear Message", function()
    client.exec("clear")
end)

ui.new_button("Config", "Presets", "Reset KD in community", function()
    client.exec("say !rs")
end)

local clear_1 = ui.new_checkbox("Config", "Presets", "Clear Chat")
local clear_2 = ui.new_slider("Config", "Presets", "[Detail]Clear Chat Time", 10, 50, 10, true, "s", 0.1)
client.set_event_callback("paint_ui", function()
    ui.set_visible(clear_2, ui.get(clear_1))
end)
function clear()
    if ui.get(clear_1)then
        client.exec("say ﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽")
    end
    client.delay_call(ui.get(clear_2)/10, clear)
end
clear()


local vis_chk = ui.new_checkbox("Visuals", "Player ESP", "[Detail]Fake Angle Twinkle")
client.set_event_callback('paint', function()
    if ui.get(vis_chk)then
    local clor,clor1,clor2 = ui.reference("Visuals", "Colored models", "Local player fake")
    local r,g,b,a = ui.get(clor1)
    local alpha = 1 + math.sin(math.abs(- math.pi + globals.realtime() % (math.pi * 2))) * 219
    ui.set(clor1, r, g, b,alpha)
    ui.set(clor,true)
    ui.set(clor2,"Solid")
    end
end)






local rage_ena_ref,rage_hot_ref = ui.reference("Rage", "Aimbot", "Enabled")
local rage_target_selection_ref = ui.reference("Rage", "Aimbot", "Target selection")
local rage_target_hitbox_ref = ui.reference("Rage", "Aimbot", "Target hitbox")
local rage_multi_point_mul_ref,rage_multi_point_cob_ref,rage_multi_point_hot_ref = ui.reference("Rage", "Aimbot", "Multi-point")
local rage_multi_point_scale_ref = ui.reference("Rage", "Aimbot", "Multi-point scale")
local rage_prefer_safe_point_ref = ui.reference("Rage", "Aimbot", "Prefer safe point")
local rage_force_safe_point_ref= ui.reference("Rage", "Aimbot", "Force safe point")
local rage_avoid_unsafe_hotboxes_ref= ui.reference("Rage", "Aimbot","Avoid unsafe hitboxes")
local rage_automatic_fire_ref =ui.reference("Rage", "Aimbot", "Automatic fire")
local rage_automatic_penetration_ref = ui.reference("Rage", "Aimbot", "Automatic penetration")
local rage_silent_aim_ref= ui.reference("Rage", "Aimbot", "Silent aim")
local rage_minimum_hit_chance_ref = ui.reference("Rage", "Aimbot", "Minimum hit chance")
local rage_minimum_damage_ref = ui.reference("Rage", "Aimbot", "Minimum damage")
local rage_automatic_scope_ref =ui.reference("Rage", "Aimbot", "Automatic scope")
local rage_reduce_aim_step_ref = ui.reference("Rage", "Aimbot", "Reduce aim step")
local rage_maximum_fov_ref = ui.reference("Rage", "Aimbot", "Maximum FOV")
local rage_log_misses_due_to_spread_ref = ui.reference("Rage", "Aimbot", "Log misses due to spread")
local rage_low_fps_mitigations_ref =ui.reference("Rage", "Aimbot", "Low FPS mitigations")
local rage_remove_recoil_ref = ui.reference("Rage", "Other", "Remove recoil")
local rage_accuracy_boost_ref = ui.reference("Rage", "Other", "Accuracy boost")
local rage_delay_shot_ref = ui.reference("Rage", "Other", "Delay shot")
local rage_quick_stop_ref,rage_quick_stop_hot_ref = ui.reference("Rage", "Other", "Quick stop")
local rage_quick_stop_options_ref = ui.reference("Rage", "Other", "Quick stop options")
local rage_quick_peek_assist_ref,rage_quick_peek_assist_hot_ref = ui.reference("Rage", "Other", "Quick peek assist")
local rage_quick_peek_assist_mode_ref,rage_quick_peek_assist_mode_color_ref=ui.reference("Rage", "Other", "Quick peek assist mode")
local rage_antiaim_correction_ref = ui.reference("Rage", "Other", "Anti-aim correction")
local rage_antiaim_correction_override_ref = ui.reference("Rage", "Other", "Anti-aim correction override")
local rage_prefer_body_aim_ref = ui.reference("Rage", "Other", "Prefer body aim")
local rage_prefer_body_aim_disablers_ref = ui.reference("Rage", "Other", "Prefer body aim disablers")
local rage_force_body_aim_ref = ui.reference("Rage", "Other", "Force body aim")
local rage_force_body_aim_on_peek_ref = ui.reference("Rage", "Other", "Force body aim on peek")
local rage_duck_peek_assist_ref = ui.reference("Rage", "Other", "Duck peek assist")

weapon_name_table={"Taser","R8/Deagle","Dual Elites","USP/P2000","Glock","AK-47","AWP","Auto","SSG-08","Pistol","Rifle","Shot","Machine","Submachine"}
client.set_event_callback("setup_command", function()
    ui.set(rage_remove_recoil_ref,true)
    ui.set(rage_quick_stop_ref,true)
    ui.set(rage_quick_stop_hot_ref,"Always on")
    ui.set(rage_antiaim_correction_ref,true)
    ui.set(rage_ena_ref,true)
    ui.set(rage_hot_ref,"Always on")
    ui.set(rage_automatic_fire_ref,true)
    ui.set(rage_log_misses_due_to_spread_ref,false)
    ui.set(rage_silent_aim_ref,true)
    ui.set(rage_multi_point_cob_ref,"Always on")
    ui.set(rage_quick_peek_assist_ref,true)
end)
local penetration_chk = ui.new_checkbox("Rage", "Aimbot","[Detail] Automatic Penetration")
client.set_event_callback("setup_command", function()
    ui.set(rage_automatic_penetration_ref,ui.get(penetration_chk))
end)

local rage_minimum_damage_hotkey = ui.new_hotkey("Rage", "Aimbot", "[Detail] Minimum Dagamge Correction Hotkey Bind ->")
local rage_delay_shot_hotkey = ui.new_hotkey("Rage", "Aimbot", "[Detail] Delay Shot Correction Hotkey Bind ->")
local rage_fov_slider = ui.new_slider("Rage", "Aimbot", "[Detail] Maximum Fov",1, 180, 180, true, "°")
local rage_reduce_chk = ui.new_checkbox("Rage", "Aimbot", "[Detail] Reduce aim step")
local rage_ssg = ui.new_checkbox("Rage","Aimbot", "[Detail]".."When you use SSG-08 Enemy is slow walking force hit him baim")
local rage_speed_max = ui.new_slider("Rage", "Aimbot", "[Detail] Enemy Speed Max limit",1, 300, 100, true)
local rage_speed_min = ui.new_slider("Rage", "Aimbot", "[Detail] Enemy Speed Min limit",1, 300, 100, true)
ui.new_label("Rage", "Aimbot", "[Detail] Peek Color")
local peek_color = ui.new_color_picker("Rage", "Aimbot", "[Detail] Peek Color",255, 255, 255, 255)
local rage_weapons_comb = ui.new_combobox("Rage", "Aimbot", "[Detail] Weapons","Taser","R8/Deagle","Dual Elites","USP/P2000","Glock","AK-47","AWP","Auto","SSG-08","Pistol","Rifle","Shot","Machine","Submachine")

client.set_event_callback("setup_command",function()
    ui.set(rage_quick_peek_assist_mode_color_ref,ui.get(peek_color))
end)

client.set_event_callback("paint_ui", function()
    ui.set_visible(rage_speed_max, ui.get(rage_ssg))
    ui.set_visible(rage_speed_min, ui.get(rage_ssg))
end)

client.set_event_callback("setup_command", function()
    ui.set(rage_reduce_aim_step_ref,ui.get(rage_reduce_chk))
end)
client.set_event_callback("setup_command", function()
    ui.set(rage_maximum_fov_ref,ui.get(rage_fov_slider))
end)

client.set_event_callback("setup_command", function()
    ui.set(rage_delay_shot_ref,ui.get(rage_delay_shot_hotkey))
end)


g =0 
client.set_event_callback("setup_command", function()
    local me = entity.get_local_player()
    local army = entity.get_players(true)
    for i = 1,#army do
        g =0
            if army ~= nil then
                for key = 1,18 do 
            local x,y,z = entity.hitbox_position(army[i], key)
            if client.visible(x,y,z)then
                g =1
            end
        end
        end
    end
end)

hurt_damage = 0
client.set_event_callback("setup_command", function()
    if ui.get(rage_minimum_damage_hotkey)then--minimum damage
        hurt_damage = 1
    elseif fl == 1 then--air
        hurt_damage = 2
    elseif g == 1 then --visible
        hurt_damage = 3
    elseif g == 0 then -- autowall
        hurt_damage = 0 
    end
end)

quick_walk = 0
client.set_event_callback("setup_command",function()
    local ent = entity.get_players(true)
    for i= 1,#ent do
        quick_walk = 0
        if ent ~= nil then
    local vec = entity.get_prop(ent[i],  "m_vecVelocity[0]")
    local vec_1 = entity.get_prop(ent[i],  "m_vecVelocity[1]")
    local speed  = math.modf(math.sqrt(vec*vec+vec_1*vec_1))
    if speed > ui.get(rage_speed_min) and speed < ui.get(rage_speed_max) then
        quick_walk = 1
    end
end
end
end)

client.set_event_callback("setup_command",function()
    local me = entity.get_local_player()
    local we = entity.get_player_weapon(me)
    local we_na = entity.get_classname(we)
    if ui.get(rage_ssg) and quick_walk == 1 and we_na == "CWeaponSSG08"then
        ui.set(rage_force_body_aim_ref,"Always on")
    else
        ui.set(rage_force_body_aim_ref,"On hotkey")
    end
end)

local we_ui_vis = ui.new_combobox("Rage", "Aimbot", "[Detail] Aimbot UI Visible", "Visible","Autowall","Minimum","Airing")

weapon_name_type={}
function rage_ui_add()
    for i=1,#weapon_name_table do
        weapon_name_type[i]={
            ["Target selection"]=ui.new_combobox("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Target selection", "Cycle","Cycle (2x)","Near crosshair","Highest damage","Lowest ping","Best K/D ration","Best hit chance"),
            ["Multi-point_mode"] = ui.new_combobox("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Multi-point Mode", "Low","Medium","High"),
            ["Accuracy boost"] = ui.new_combobox("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Accuracy boost", "Off","Low","Medium","High","Maximum"),
            ["Prefer safe point"] = ui.new_checkbox("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Prefer safe point"),
            ["Prefer body aim"] = ui.new_checkbox("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Prefer body aim"),
            ["Prefer body aim disablers"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Prefer body aim disablers ","Low inaccuracy","Target shot fired","Target resolved","Safe point headshot","Low damage"),
            ["Force safe point"] = ui.new_checkbox("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Force safe point"),
            ["Automatic scope"] = ui.new_checkbox("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Automatic scope"),
            ["Force body aim on peek"] = ui.new_checkbox("Rage","Aimbot", "[Detail "..weapon_name_table[i].."]".."Force body aim on peek"),
            ["Quick peek assist mode"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Quick peek assist mode ","Retreat on shot","Retreat on key release"),
            
            ["Visi-quick stop options"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Visible-Quick stop options ","Early","Slow motion","Duck","Fake duck","Move between shots","Ignore molotov","Taser"),
            ["Visi-Target hitbox"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Visible-Target hitbox", "Head","Chest","Stomach","Arms","Legs","Feet"),
            ["Visi-Multi-point"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Visible-Multi-point", "Head","Chest","Stomach","Arms","Legs","Feet"),
            ["Visi-Multi-point scale"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Visible-Multi-point scale",25, 100, 25, true, "%"),
            ["Visi-Avoid unsafe hitboxes"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Visible-Avoid unsafe hitboxes", "Head","Chest","Stomach","Arms","Legs"),
            ["Visi-Minimum hit chance"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Visible-Minimum hit chance", 1, 100, 1, true,"%"),
            ["Visi-Minimum damage"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Visible-Minimum damage", 1, 126, 1),

            ["Auto-quick stop options"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Autowall-Quick stop options ","Early","Slow motion","Duck","Fake duck","Move between shots","Ignore molotov","Taser"),
            ["Auto-Target hitbox"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Autowall-Target hitbox", "Head","Chest","Stomach","Arms","Legs","Feet"),
            ["Auto-Multi-point"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Autowall-Multi-point", "Head","Chest","Stomach","Arms","Legs","Feet"),
            ["Auto-Multi-point scale"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Autowall-Multi-point scale",25, 100, 25, true, "%"),
            ["Auto-Avoid unsafe hitboxes"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Autowall-Avoid unsafe hitboxes", "Head","Chest","Stomach","Arms","Legs"),
            ["Auto-Minimum hit chance"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Autowall-Minimum hit chance", 1, 100, 1, true,"%"),
            ["Auto-Minimum damage"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Autowall-Minimum damage", 1, 126, 1),

            ["Mini-quick stop options"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Minimum-Quick stop options ","Early","Slow motion","Duck","Fake duck","Move between shots","Ignore molotov","Taser"),
            ["Mini-Target hitbox"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Minimum-Target hitbox", "Head","Chest","Stomach","Arms","Legs","Feet"),
            ["Mini-Multi-point"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Minimum-Multi-point", "Head","Chest","Stomach","Arms","Legs","Feet"),
            ["Mini-Multi-point scale"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Minimum-Multi-point scale",25, 100, 25, true, "%"),
            ["Mini-Avoid unsafe hitboxes"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Minimum-Avoid unsafe hitboxes", "Head","Chest","Stomach","Arms","Legs"),
            ["Mini-Minimum hit chance"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Minimum-Minimum hit chance", 1, 100, 1, true,"%"),
            ["Mini-Minimum damage"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."Minimum-Minimum damage", 1, 126, 1),

            ["Air-quick stop options"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."In the Air-Quick stop options ","Early","Slow motion","Duck","Fake duck","Move between shots","Ignore molotov","Taser"),
            ["Air-Target hitbox"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."In the Air-Target hitbox", "Head","Chest","Stomach","Arms","Legs","Feet"),
            ["Air-Multi-point"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."In the Air-Multi-point", "Head","Chest","Stomach","Arms","Legs","Feet"),
            ["Air-Multi-point scale"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."In the Air-Multi-point scale",25, 100, 25, true, "%"),
            ["Air-Avoid unsafe hitboxes"] = ui.new_multiselect("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."In the Air-Avoid unsafe hitboxes", "Head","Chest","Stomach","Arms","Legs"),
            ["Air-Minimum hit chance"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."In the Air-Minimum hit chance", 1, 100, 1, true,"%"),
            ["Air-Minimum damage"] = ui.new_slider("rage", "Aimbot", "[Detail "..weapon_name_table[i].."]".."In the Air-Minimum damage", 1, 126, 1),
        }
    end
end
rage_ui_add()

function set_ui()
    for i = 1 ,#weapon_name_table do
        ui.set(weapon_name_type[i]["Air-Target hitbox"],"Head")
        ui.set(weapon_name_type[i]["Mini-Target hitbox"],"Head")
        ui.set(weapon_name_type[i]["Auto-Target hitbox"],"Head")
        ui.set(weapon_name_type[i]["Visi-Target hitbox"],"Head")
        ui.set(weapon_name_type[i]["Quick peek assist mode"],"Retreat on shot")
    end
end
set_ui()



client.set_event_callback("paint_ui", function()
    for i = 1 , #weapon_name_table do 
        if ui.get(rage_weapons_comb) == weapon_name_table[i] then
            for key = 1 , i-1 do--down to up for false
                ui.set_visible(weapon_name_type[key]["Target selection"], false)
            ui.set_visible(weapon_name_type[key]["Multi-point_mode"], false)
            ui.set_visible(weapon_name_type[key]["Prefer safe point"], false)
            ui.set_visible(weapon_name_type[key]["Visi-quick stop options"], false)
            ui.set_visible(weapon_name_type[key]["Auto-quick stop options"], false)
            ui.set_visible(weapon_name_type[key]["Mini-quick stop options"], false)
            ui.set_visible(weapon_name_type[key]["Air-quick stop options"], false)
            ui.set_visible(weapon_name_type[key]["Automatic scope"], false)
            ui.set_visible(weapon_name_type[key]["Force body aim on peek"], false)
            ui.set_visible(weapon_name_type[key]["Visi-Target hitbox"], false)
            ui.set_visible(weapon_name_type[key]["Visi-Multi-point"], false)
            ui.set_visible(weapon_name_type[key]["Visi-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[key]["Visi-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[key]["Visi-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[key]["Visi-Minimum damage"], false)
            ui.set_visible(weapon_name_type[key]["Auto-Target hitbox"], false)
            ui.set_visible(weapon_name_type[key]["Auto-Multi-point"], false)
            ui.set_visible(weapon_name_type[key]["Auto-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[key]["Auto-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[key]["Auto-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[key]["Auto-Minimum damage"], false)
            ui.set_visible(weapon_name_type[key]["Mini-Target hitbox"], false)
            ui.set_visible(weapon_name_type[key]["Mini-Multi-point"], false)
            ui.set_visible(weapon_name_type[key]["Mini-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[key]["Mini-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[key]["Mini-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[key]["Mini-Minimum damage"], false)
            ui.set_visible(weapon_name_type[key]["Air-Target hitbox"], false)
            ui.set_visible(weapon_name_type[key]["Air-Multi-point"], false)
            ui.set_visible(weapon_name_type[key]["Air-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[key]["Air-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[key]["Air-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[key]["Air-Minimum damage"], false)
            ui.set_visible(weapon_name_type[key]["Prefer body aim"], false)
            ui.set_visible(weapon_name_type[key]["Force safe point"], false)
            ui.set_visible(weapon_name_type[key]["Prefer body aim disablers"], false)
            ui.set_visible(weapon_name_type[key]["Quick peek assist mode"], false)
            ui.set_visible(weapon_name_type[key]["Accuracy boost"], false)
            end
            if ui.get(we_ui_vis)=="Visible"then
                ui.set_visible(weapon_name_type[i]["Target selection"], true)
            ui.set_visible(weapon_name_type[i]["Multi-point_mode"], true)
            ui.set_visible(weapon_name_type[i]["Prefer safe point"], true)
            ui.set_visible(weapon_name_type[i]["Visi-quick stop options"], true)
            ui.set_visible(weapon_name_type[i]["Auto-quick stop options"], false)
            ui.set_visible(weapon_name_type[i]["Mini-quick stop options"], false)
            ui.set_visible(weapon_name_type[i]["Air-quick stop options"], false)
            ui.set_visible(weapon_name_type[i]["Automatic scope"], true)
            ui.set_visible(weapon_name_type[i]["Force body aim on peek"], true)
            ui.set_visible(weapon_name_type[i]["Visi-Target hitbox"], true)
            ui.set_visible(weapon_name_type[i]["Visi-Multi-point"], true)
            ui.set_visible(weapon_name_type[i]["Visi-Multi-point scale"], true)
            ui.set_visible(weapon_name_type[i]["Visi-Avoid unsafe hitboxes"], true)
            ui.set_visible(weapon_name_type[i]["Visi-Minimum hit chance"], true)
            ui.set_visible(weapon_name_type[i]["Visi-Minimum damage"], true)
            ui.set_visible(weapon_name_type[i]["Auto-Target hitbox"], false)
            ui.set_visible(weapon_name_type[i]["Auto-Multi-point"], false)
            ui.set_visible(weapon_name_type[i]["Auto-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[i]["Auto-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[i]["Auto-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[i]["Auto-Minimum damage"], false)
            ui.set_visible(weapon_name_type[i]["Mini-Target hitbox"], false)
            ui.set_visible(weapon_name_type[i]["Mini-Multi-point"], false)
            ui.set_visible(weapon_name_type[i]["Mini-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[i]["Mini-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[i]["Mini-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[i]["Mini-Minimum damage"], false)
            ui.set_visible(weapon_name_type[i]["Air-Target hitbox"], false)
            ui.set_visible(weapon_name_type[i]["Air-Multi-point"], false)
            ui.set_visible(weapon_name_type[i]["Air-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[i]["Air-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[i]["Air-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[i]["Air-Minimum damage"], false)
            ui.set_visible(weapon_name_type[i]["Prefer body aim"], true)
            ui.set_visible(weapon_name_type[i]["Force safe point"], true)
            ui.set_visible(weapon_name_type[i]["Prefer body aim disablers"], true)
            ui.set_visible(weapon_name_type[i]["Quick peek assist mode"], true)
            ui.set_visible(weapon_name_type[i]["Accuracy boost"], true)
            elseif ui.get(we_ui_vis)=="Autowall"then
                ui.set_visible(weapon_name_type[i]["Target selection"], true)
                ui.set_visible(weapon_name_type[i]["Multi-point_mode"], true)
                ui.set_visible(weapon_name_type[i]["Prefer safe point"], true)
                ui.set_visible(weapon_name_type[i]["Visi-quick stop options"], false)
                ui.set_visible(weapon_name_type[i]["Auto-quick stop options"], true)
                ui.set_visible(weapon_name_type[i]["Mini-quick stop options"], false)
                ui.set_visible(weapon_name_type[i]["Air-quick stop options"], false)
                ui.set_visible(weapon_name_type[i]["Automatic scope"], true)
                ui.set_visible(weapon_name_type[i]["Force body aim on peek"], true)
                ui.set_visible(weapon_name_type[i]["Visi-Target hitbox"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Multi-point"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Multi-point scale"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Avoid unsafe hitboxes"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Minimum hit chance"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Minimum damage"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Target hitbox"], true)
                ui.set_visible(weapon_name_type[i]["Auto-Multi-point"], true)
                ui.set_visible(weapon_name_type[i]["Auto-Multi-point scale"], true)
                ui.set_visible(weapon_name_type[i]["Auto-Avoid unsafe hitboxes"], true)
                ui.set_visible(weapon_name_type[i]["Auto-Minimum hit chance"], true)
                ui.set_visible(weapon_name_type[i]["Auto-Minimum damage"], true)
                ui.set_visible(weapon_name_type[i]["Mini-Target hitbox"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Multi-point"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Multi-point scale"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Avoid unsafe hitboxes"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Minimum hit chance"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Minimum damage"], false)
                ui.set_visible(weapon_name_type[i]["Air-Target hitbox"], false)
                ui.set_visible(weapon_name_type[i]["Air-Multi-point"], false)
                ui.set_visible(weapon_name_type[i]["Air-Multi-point scale"], false)
                ui.set_visible(weapon_name_type[i]["Air-Avoid unsafe hitboxes"], false)
                ui.set_visible(weapon_name_type[i]["Air-Minimum hit chance"], false)
                ui.set_visible(weapon_name_type[i]["Air-Minimum damage"], false)
                ui.set_visible(weapon_name_type[i]["Prefer body aim"], true)
                ui.set_visible(weapon_name_type[i]["Force safe point"], true)
                ui.set_visible(weapon_name_type[i]["Prefer body aim disablers"], true)
                ui.set_visible(weapon_name_type[i]["Quick peek assist mode"], true)
                ui.set_visible(weapon_name_type[i]["Accuracy boost"], true)
            elseif ui.get(we_ui_vis)=="Minimum"then
                ui.set_visible(weapon_name_type[i]["Target selection"], true)
                ui.set_visible(weapon_name_type[i]["Multi-point_mode"], true)
                ui.set_visible(weapon_name_type[i]["Prefer safe point"], true)
                ui.set_visible(weapon_name_type[i]["Visi-quick stop options"], false)
                ui.set_visible(weapon_name_type[i]["Auto-quick stop options"], false)
                ui.set_visible(weapon_name_type[i]["Mini-quick stop options"], true)
                ui.set_visible(weapon_name_type[i]["Air-quick stop options"], false)
                ui.set_visible(weapon_name_type[i]["Automatic scope"], true)
                ui.set_visible(weapon_name_type[i]["Force body aim on peek"], true)
                ui.set_visible(weapon_name_type[i]["Visi-Target hitbox"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Multi-point"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Multi-point scale"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Avoid unsafe hitboxes"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Minimum hit chance"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Minimum damage"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Target hitbox"],false)
                ui.set_visible(weapon_name_type[i]["Auto-Multi-point"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Multi-point scale"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Avoid unsafe hitboxes"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Minimum hit chance"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Minimum damage"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Target hitbox"], true)
                ui.set_visible(weapon_name_type[i]["Mini-Multi-point"], true)
                ui.set_visible(weapon_name_type[i]["Mini-Multi-point scale"], true)
                ui.set_visible(weapon_name_type[i]["Mini-Avoid unsafe hitboxes"], true)
                ui.set_visible(weapon_name_type[i]["Mini-Minimum hit chance"], true)
                ui.set_visible(weapon_name_type[i]["Mini-Minimum damage"], true)
                ui.set_visible(weapon_name_type[i]["Air-Target hitbox"], false)
                ui.set_visible(weapon_name_type[i]["Air-Multi-point"], false)
                ui.set_visible(weapon_name_type[i]["Air-Multi-point scale"], false)
                ui.set_visible(weapon_name_type[i]["Air-Avoid unsafe hitboxes"], false)
                ui.set_visible(weapon_name_type[i]["Air-Minimum hit chance"], false)
                ui.set_visible(weapon_name_type[i]["Air-Minimum damage"], false)
                ui.set_visible(weapon_name_type[i]["Prefer body aim"], true)
                ui.set_visible(weapon_name_type[i]["Force safe point"], true)
                ui.set_visible(weapon_name_type[i]["Prefer body aim disablers"], true)
                ui.set_visible(weapon_name_type[i]["Quick peek assist mode"], true)
                ui.set_visible(weapon_name_type[i]["Accuracy boost"], true)
            else
                ui.set_visible(weapon_name_type[i]["Target selection"], true)
                ui.set_visible(weapon_name_type[i]["Multi-point_mode"], true)
                ui.set_visible(weapon_name_type[i]["Prefer safe point"], true)
                ui.set_visible(weapon_name_type[i]["Visi-quick stop options"], false)
                ui.set_visible(weapon_name_type[i]["Auto-quick stop options"], false)
                ui.set_visible(weapon_name_type[i]["Mini-quick stop options"], false)
                ui.set_visible(weapon_name_type[i]["Air-quick stop options"], true)
                ui.set_visible(weapon_name_type[i]["Automatic scope"], true)
                ui.set_visible(weapon_name_type[i]["Force body aim on peek"], true)
                ui.set_visible(weapon_name_type[i]["Visi-Target hitbox"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Multi-point"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Multi-point scale"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Avoid unsafe hitboxes"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Minimum hit chance"], false)
                ui.set_visible(weapon_name_type[i]["Visi-Minimum damage"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Target hitbox"],false)
                ui.set_visible(weapon_name_type[i]["Auto-Multi-point"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Multi-point scale"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Avoid unsafe hitboxes"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Minimum hit chance"], false)
                ui.set_visible(weapon_name_type[i]["Auto-Minimum damage"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Target hitbox"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Multi-point"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Multi-point scale"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Avoid unsafe hitboxes"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Minimum hit chance"], false)
                ui.set_visible(weapon_name_type[i]["Mini-Minimum damage"], false)
                ui.set_visible(weapon_name_type[i]["Air-Target hitbox"], true)
                ui.set_visible(weapon_name_type[i]["Air-Multi-point"], true)
                ui.set_visible(weapon_name_type[i]["Air-Multi-point scale"], true)
                ui.set_visible(weapon_name_type[i]["Air-Avoid unsafe hitboxes"], true)
                ui.set_visible(weapon_name_type[i]["Air-Minimum hit chance"], true)
                ui.set_visible(weapon_name_type[i]["Air-Minimum damage"], true)
                ui.set_visible(weapon_name_type[i]["Prefer body aim"], true)
                ui.set_visible(weapon_name_type[i]["Force safe point"], true)
                ui.set_visible(weapon_name_type[i]["Prefer body aim disablers"], true)
                ui.set_visible(weapon_name_type[i]["Quick peek assist mode"], true)
                ui.set_visible(weapon_name_type[i]["Accuracy boost"], true)
            end
            for p = i + 1,#weapon_name_table do 
                ui.set_visible(weapon_name_type[p]["Target selection"], false)
            ui.set_visible(weapon_name_type[p]["Multi-point_mode"], false)
            ui.set_visible(weapon_name_type[p]["Prefer safe point"], false)
            ui.set_visible(weapon_name_type[p]["Visi-quick stop options"], false)
            ui.set_visible(weapon_name_type[p]["Auto-quick stop options"], false)
            ui.set_visible(weapon_name_type[p]["Mini-quick stop options"], false)
            ui.set_visible(weapon_name_type[p]["Air-quick stop options"], false)
            ui.set_visible(weapon_name_type[p]["Automatic scope"], false)
            ui.set_visible(weapon_name_type[p]["Force body aim on peek"], false)
            ui.set_visible(weapon_name_type[p]["Visi-Target hitbox"], false)
            ui.set_visible(weapon_name_type[p]["Visi-Multi-point"], false)
            ui.set_visible(weapon_name_type[p]["Visi-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[p]["Visi-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[p]["Visi-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[p]["Visi-Minimum damage"], false)
            ui.set_visible(weapon_name_type[p]["Auto-Target hitbox"], false)
            ui.set_visible(weapon_name_type[p]["Auto-Multi-point"], false)
            ui.set_visible(weapon_name_type[p]["Auto-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[p]["Auto-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[p]["Auto-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[p]["Auto-Minimum damage"], false)
            ui.set_visible(weapon_name_type[p]["Mini-Target hitbox"], false)
            ui.set_visible(weapon_name_type[p]["Mini-Multi-point"], false)
            ui.set_visible(weapon_name_type[p]["Mini-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[p]["Mini-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[p]["Mini-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[p]["Mini-Minimum damage"], false)
            ui.set_visible(weapon_name_type[p]["Air-Target hitbox"], false)
            ui.set_visible(weapon_name_type[p]["Air-Multi-point"], false)
            ui.set_visible(weapon_name_type[p]["Air-Multi-point scale"], false)
            ui.set_visible(weapon_name_type[p]["Air-Avoid unsafe hitboxes"], false)
            ui.set_visible(weapon_name_type[p]["Air-Minimum hit chance"], false)
            ui.set_visible(weapon_name_type[p]["Air-Minimum damage"], false)
            ui.set_visible(weapon_name_type[p]["Prefer body aim"], false)
            ui.set_visible(weapon_name_type[p]["Force safe point"], false)
            ui.set_visible(weapon_name_type[p]["Prefer body aim disablers"], false)
            ui.set_visible(weapon_name_type[p]["Quick peek assist mode"], false)
            ui.set_visible(weapon_name_type[p]["Accuracy boost"], false)
            end
        end
    end
end)


client.set_event_callback("paint_ui", function()
    ui.set_visible(rage_remove_recoil_ref, false)
    ui.set_visible(rage_accuracy_boost_ref, false)
    ui.set_visible(rage_quick_stop_ref, false)
    ui.set_visible(rage_quick_stop_hot_ref, false)
    ui.set_visible(rage_antiaim_correction_ref, false)
    ui.set_visible(rage_ena_ref, false)
    ui.set_visible(rage_hot_ref, false)
    ui.set_visible(rage_automatic_penetration_ref, false)
    ui.set_visible(rage_log_misses_due_to_spread_ref, false)
    ui.set_visible(rage_low_fps_mitigations_ref, false)
    ui.set_visible(rage_delay_shot_ref, false)
    ui.set_visible(rage_maximum_fov_ref, false)
    ui.set_visible(rage_reduce_aim_step_ref, false)
    ui.set_visible(rage_automatic_fire_ref, false)
    ui.set_visible(rage_silent_aim_ref, false)
    ui.set_visible(rage_force_body_aim_ref, false)
    ui.set_visible(rage_multi_point_cob_ref, false)

    ui.set_visible(rage_target_selection_ref, false)
    ui.set_visible(rage_target_hitbox_ref, false)
    ui.set_visible(rage_multi_point_mul_ref, false)
    ui.set_visible(rage_prefer_safe_point_ref, false)
    ui.set_visible(rage_force_safe_point_ref, false)
    ui.set_visible(rage_avoid_unsafe_hotboxes_ref, false)
    ui.set_visible(rage_minimum_hit_chance_ref, false)
    ui.set_visible(rage_minimum_damage_ref, false)
    ui.set_visible(rage_automatic_scope_ref, false)

    ui.set_visible(rage_quick_stop_options_ref, false)
    ui.set_visible(rage_quick_peek_assist_mode_ref, false)
    ui.set_visible(rage_force_body_aim_on_peek_ref, false)
    ui.set_visible(rage_quick_peek_assist_mode_color_ref, false)
    ui.set_visible(rage_multi_point_scale_ref, false)
    ui.set_visible(rage_accuracy_boost_ref, false)
    ui.set_visible(rage_multi_point_hot_ref, false)
end)

client.set_event_callback("shutdown", function()
    ui.set_visible(rage_remove_recoil_ref, true)
    ui.set_visible(rage_accuracy_boost_ref, true)
    ui.set_visible(rage_quick_stop_ref, true)
    ui.set_visible(rage_quick_stop_hot_ref, true)
    ui.set_visible(rage_antiaim_correction_ref, true)
    ui.set_visible(rage_ena_ref, true)
    ui.set_visible(rage_hot_ref, true)
    ui.set_visible(rage_automatic_penetration_ref, true)
    ui.set_visible(rage_log_misses_due_to_spread_ref, true)
    ui.set_visible(rage_low_fps_mitigations_ref, true)
    ui.set_visible(rage_delay_shot_ref, true)
    ui.set_visible(rage_maximum_fov_ref, true)
    ui.set_visible(rage_reduce_aim_step_ref, true)
    ui.set_visible(rage_automatic_fire_ref, true)
    ui.set_visible(rage_silent_aim_ref, true)
    ui.set_visible(rage_force_body_aim_ref, true)
    ui.set_visible(rage_multi_point_cob_ref, true)
    ui.set_visible(rage_target_selection_ref, true)
    ui.set_visible(rage_target_hitbox_ref, true)
    ui.set_visible(rage_multi_point_mul_ref, true)
    ui.set_visible(rage_multi_point_hot_ref, true)
    ui.set_visible(rage_prefer_safe_point_ref, true)
    ui.set_visible(rage_force_safe_point_ref, true)
    ui.set_visible(rage_avoid_unsafe_hotboxes_ref, true)
    ui.set_visible(rage_minimum_hit_chance_ref, true)
    ui.set_visible(rage_minimum_damage_ref, true)
    ui.set_visible(rage_automatic_scope_ref, true)
    ui.set_visible(rage_quick_stop_options_ref, true)
    ui.set_visible(rage_quick_peek_assist_mode_ref, true)
    ui.set_visible(rage_force_body_aim_on_peek_ref, true)
    ui.set_visible(rage_quick_peek_assist_mode_color_ref, true)
    ui.set_visible(rage_multi_point_scale_ref, true)
    ui.set_visible(rage_accuracy_boost_ref, true)
end)


name_type = 1
client.set_event_callback("setup_command",function()
    local me = entity.get_local_player()
    local we = entity.get_player_weapon(me)
    local we_na = entity.get_classname(we)
    if we_na == "CWeaponTaser" then
        name_type = 1
    elseif we_na == "CDEagle" then
        name_type = 2
    elseif we_na == "CWeaponElite" then
        name_type = 3 
    elseif we_na == "CWeaponHKP2000" then
        name_type = 4
    elseif we_na == "CWeaponGlock" then
        name_type = 5
    elseif we_na == "CAK47" then
        name_type = 6
    elseif we_na == "CWeaponAWP" then
        name_type = 7
    elseif we_na == "CWeaponSCAR20" then
        name_type = 8
    elseif we_na == "CWeaponG3SG1" then
        name_type = 8
    elseif we_na == "CWeaponSSG08" then
        name_type = 9
    elseif we_na == "CWeaponP250" or we_na == "CWeaponTec9" or we_na == "CWeaponFiveSeven" then
        name_type = 10 
    elseif we_na == "CWeaponGalilAR" or we_na == "CWeaponSG556" or we_na == "CWeaponFamas" or we_na == "CWeaponM4A1" or we_na == "CWeaponAug"then
        name_type = 11
    elseif we_na == "CWeaponNOVA" or we_na == "CWeaponXM1014" or we_na == "CWeaponMag7" or we_na == "CWeaponSawedoff"then
        name_type = 12
    elseif we_na == "CWeaponNegev" or we_na == "CWeaponM249" then
        name_type = 13
    elseif we_na == "CWeaponMAC10" or we_na == "CWeaponMP7" or we_na == "CWeaponUMP45" or we_na == "CWeaponP90" or we_na == "CWeaponBizon" or we_na == "CWeaponMP9" then
        name_type = 14
    end
end)


client.set_event_callback("setup_command", function()
    ui.set(rage_accuracy_boost_ref,ui.get(weapon_name_type[name_type]["Accuracy boost"]))
    ui.set(rage_target_selection_ref,ui.get(weapon_name_type[name_type]["Target selection"]))
    ui.set(rage_multi_point_hot_ref,ui.get(weapon_name_type[name_type]["Multi-point_mode"]))
    ui.set(rage_prefer_safe_point_ref,ui.get(weapon_name_type[name_type]["Prefer safe point"]))
    ui.set(rage_prefer_body_aim_ref,ui.get(weapon_name_type[name_type]["Prefer body aim"]))
    ui.set(rage_prefer_body_aim_disablers_ref,ui.get(weapon_name_type[name_type]["Prefer body aim disablers"]))
    if ui.get(weapon_name_type[name_type]["Force safe point"]) then
    ui.set(rage_force_safe_point_ref,"Always on")
    else
        ui.set(rage_force_safe_point_ref,"On hotkey")
    end
    ui.set(rage_automatic_scope_ref,ui.get(weapon_name_type[name_type]["Automatic scope"]))
    ui.set(rage_force_body_aim_on_peek_ref,ui.get(weapon_name_type[name_type]["Force body aim on peek"]))
    ui.set(rage_quick_peek_assist_mode_ref,ui.get(weapon_name_type[name_type]["Quick peek assist mode"]))
    if hurt_damage == 1 then
        ui.set(rage_quick_stop_options_ref,ui.get(weapon_name_type[name_type]["Mini-quick stop options"]))
        ui.set(rage_target_hitbox_ref,ui.get(weapon_name_type[name_type]["Mini-Target hitbox"]))
        ui.set(rage_multi_point_mul_ref,ui.get(weapon_name_type[name_type]["Mini-Multi-point"]))
        ui.set(rage_multi_point_scale_ref,ui.get(weapon_name_type[name_type]["Mini-Multi-point scale"]))
        ui.set(rage_avoid_unsafe_hotboxes_ref,ui.get(weapon_name_type[name_type]["Mini-Avoid unsafe hitboxes"]))
        ui.set(rage_minimum_hit_chance_ref,ui.get(weapon_name_type[name_type]["Mini-Minimum hit chance"]))
        ui.set(rage_minimum_damage_ref,ui.get(weapon_name_type[name_type]["Mini-Minimum damage"]))
    elseif hurt_damage == 2 then
        ui.set(rage_quick_stop_options_ref,ui.get(weapon_name_type[name_type]["Air-quick stop options"]))
        ui.set(rage_target_hitbox_ref,ui.get(weapon_name_type[name_type]["Air-Target hitbox"]))
        ui.set(rage_multi_point_mul_ref,ui.get(weapon_name_type[name_type]["Air-Multi-point"]))
        ui.set(rage_multi_point_scale_ref,ui.get(weapon_name_type[name_type]["Air-Multi-point scale"]))
        ui.set(rage_avoid_unsafe_hotboxes_ref,ui.get(weapon_name_type[name_type]["Air-Avoid unsafe hitboxes"]))
        ui.set(rage_minimum_hit_chance_ref,ui.get(weapon_name_type[name_type]["Air-Minimum hit chance"]))
        ui.set(rage_minimum_damage_ref,ui.get(weapon_name_type[name_type]["Air-Minimum damage"]))
    elseif hurt_damage == 3 then
        ui.set(rage_quick_stop_options_ref,ui.get(weapon_name_type[name_type]["Visi-quick stop options"]))
        ui.set(rage_target_hitbox_ref,ui.get(weapon_name_type[name_type]["Visi-Target hitbox"]))
        ui.set(rage_multi_point_mul_ref,ui.get(weapon_name_type[name_type]["Visi-Multi-point"]))
        ui.set(rage_multi_point_scale_ref,ui.get(weapon_name_type[name_type]["Visi-Multi-point scale"]))
        ui.set(rage_avoid_unsafe_hotboxes_ref,ui.get(weapon_name_type[name_type]["Visi-Avoid unsafe hitboxes"]))
        ui.set(rage_minimum_hit_chance_ref,ui.get(weapon_name_type[name_type]["Visi-Minimum hit chance"]))
        ui.set(rage_minimum_damage_ref,ui.get(weapon_name_type[name_type]["Visi-Minimum damage"]))
    elseif hurt_damage == 0 then
        ui.set(rage_quick_stop_options_ref,ui.get(weapon_name_type[name_type]["Auto-quick stop options"]))
        ui.set(rage_target_hitbox_ref,ui.get(weapon_name_type[name_type]["Auto-Target hitbox"]))
        ui.set(rage_multi_point_mul_ref,ui.get(weapon_name_type[name_type]["Auto-Multi-point"]))
        ui.set(rage_multi_point_scale_ref,ui.get(weapon_name_type[name_type]["Auto-Multi-point scale"]))
        ui.set(rage_avoid_unsafe_hotboxes_ref,ui.get(weapon_name_type[name_type]["Auto-Avoid unsafe hitboxes"]))
        ui.set(rage_minimum_hit_chance_ref,ui.get(weapon_name_type[name_type]["Auto-Minimum hit chance"]))
        ui.set(rage_minimum_damage_ref,ui.get(weapon_name_type[name_type]["Auto-Minimum damage"]))
    end
end)

client.set_event_callback("paint", function()
    local x,y = client.screen_size()
    if hurt_damage == 1 then
        renderer.text(x/2, y/2-100, 0, 255, 255, 180, "c+", 0,"MIN")
    end
    if ui.get(rage_delay_shot_ref)then
        renderer.text(x/2, y/2-130, 0, 255, 255, 180, "c+", 0,"DELAY")
    end
end)







local globals_realtime = globals.realtime
local globals_curtime = globals.curtime
local globals_maxplayers = globals.maxplayers
local globals_tickcount = globals.tickcount
local globals_tickinterval = globals.tickinterval
local globals_mapname = globals.mapname

local client_set_event_callback = client.set_event_callback
local client_console_log = client.log
local client_console_cmd = client.exec
local client_userid_to_entindex = client.userid_to_entindex
local client_get_cvar = client.get_cvar
local client_draw_debug_text = client.draw_debug_text
local client_draw_hitboxes = client.draw_hitboxes
local client_random_int = client.random_int
local client_random_float = client.random_float
local client_draw_text = client.draw_text
local client_draw_rectangle = client.draw_rectangle
local client_draw_line = client.draw_line
local client_world_to_screen = client.world_to_screen
local client_delay_call = client.delay_call
local client_visible = client.visible

local ui_new_checkbox = ui.new_checkbox
local ui_new_slider = ui.new_slider
local ui_new_button = ui.new_button
local ui_new_combobox = ui.new_combobox
local ui_new_multiselect = ui.new_multiselect
local ui_new_hotkey = ui.new_hotkey
local ui_set = ui.set
local ui_get = ui.get
local ui_set_visible = ui.set_visible

local entity_get_local_player = entity.get_local_player
local entity_get_all = entity.get_all
local entity_get_players = entity.get_players
local entity_get_classname = entity.get_classname
local entity_set_prop = entity.set_prop
local entity_get_prop = entity.get_prop
local entity_is_enemy = entity.is_enemy
local entity_get_player_name = entity.get_player_name
local entity_get_player_weapon = entity.get_player_weapon

local table_concat = table.concat
local table_insert = table.insert
local to_number = tonumber
local math_floor = math.floor
local table_remove = table.remove
local string_format = string.format

local delay = 0.03

local primary_weapons = {
	{name='-', command=""},
	{name='AWP', command="buy awp; "},
	{name='Auto-Sniper', command="buy scar20; buy g3sg1; "},
	{name='Scout', command="buy ssg08; "},
	{name='Negev', command="buy negev; "}
}

local secondary_weapons = {
	{name='-', command=""},
	{name='R8 Revolver / Deagle', command="buy deagle; "},
	{name='Dual Berettas', command="buy elite; "},
	{name='FN57 / Tec9 / CZ75-Auto', command="buy fn57; "}
}

local gear_weapons = {
	{name='Kevlar', command="buy vest; "},
	{name='Helmet', command="buy vesthelm; "},
	{name='Defuse Kit', command="buy defuser; "},
	{name='Grenade', command="buy hegrenade; "},
	{name='Molotov', command="buy incgrenade; "},
	{name='Smoke', command="buy smokegrenade; "},
	{name='Flashbang (x2)', command="buy flashbang; "},
	{name='Taser', command="buy taser; "},
}

local function get_names(table)
	local names = {}
	for i=1, #table do
		table_insert(names, table[i]["name"])
	end
	return names
end

local function get_command(table, name)
	for i=1, #table do
		if table[i]["name"] == name then
			return table[i]["command"]
		end
	end
end

local buybot_enabled = ui_new_checkbox("MISC", "Miscellaneous", "Auto-Buy")
local buybot_primary = ui_new_combobox("MISC", "Miscellaneous", "Auto-Buy: Primary", get_names(primary_weapons))
local buybot_pistol = ui_new_combobox("MISC", "Miscellaneous", "Auto-Buy: Secondary", get_names(secondary_weapons))
local buybot_gear = ui_new_multiselect("MISC", "Miscellaneous", "Auto-Buy: Gear", get_names(gear_weapons))

local function on_enabled_change()
	local enabled = ui_get(buybot_enabled)
	ui_set_visible(buybot_primary, enabled)
	ui_set_visible(buybot_pistol, enabled)
	ui_set_visible(buybot_gear, enabled)
end
on_enabled_change()
ui.set_callback(buybot_enabled, on_enabled_change)

local function run_buybot(e)
	local userid = e.userid
	if userid ~= nil then
		if client_userid_to_entindex(userid) ~= entity_get_local_player() then
			return
		end
	end

	if not ui_get(buybot_enabled) then
		return
	end

	local primary = ui_get(buybot_primary)
	local pistol = ui_get(buybot_pistol)
	local gear = ui_get(buybot_gear)

	local commands = {}

	table_insert(commands, get_command(primary_weapons, primary))
	table_insert(commands, get_command(secondary_weapons, pistol))
	
	for i=1, #gear do
		table_insert(commands, get_command(gear_weapons, gear[i]))
	end

	table_insert(commands, "use weapon_knife;")

	local command = table_concat(commands, "")
	client_console_cmd(command)
	--client_delay_call(delay, client_console_cmd, command)

end

--ui_new_button("MISC", "Miscellaneous", "Auto-Buy Test", run_buybot)

--client_set_event_callback("round_prestart", run_buybot)
client_set_event_callback("player_spawn", run_buybot)