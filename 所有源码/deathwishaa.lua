ui.new_label("AA", "Anti-aimbot angles", "---[deathwish] Anti-Aim ---")
     local leg_com= ui.new_combobox("AA", "Anti-aimbot angles","[deathwish] Leg movement","Never slide","Always slide","Both On")
     local leg_ref =ui.reference("AA", "Other", "Leg movement")
     client.set_event_callback("setup_command", function()
         if ui.get(leg_com)~="Both On" then
             ui.set(leg_ref,ui.get(leg_com))
         else
             local random = client.random_int(0, 10)
             if random <3 then
                 ui.set(leg_ref,"Never slide")
             else
                 ui.set(leg_ref,"Always slide")
             end
         end
     end)
     
     
     
     
     ui.new_label("AA", "Anti-aimbot angles", "[deathwish]Anti-Aim Status Text Color Picker")
     local text_color = ui.new_color_picker("AA", "Anti-aimbot angles","[deathwish]Anti-Aim Status Text Color Picker_1", 255, 255, 255, 255)
     
     ui.new_label("AA", "Anti-aimbot angles", "[deathwish]Anti-Aim Status Ind Color Picker")
     local text_color_1 = ui.new_color_picker("AA", "Anti-aimbot angles","[deathwish]Anti-Aim Status Text Color Picker_2", 255, 255, 255, 255)
     
     ui.new_label("AA", "Anti-aimbot angles", "[deathwish]Anti-Aim Status Ind Correction Color Picker")
     local text_color_2 = ui.new_color_picker("AA", "Anti-aimbot angles","[deathwish]Anti-Aim Status Text Color Picker_3", 255, 255, 255, 255)
     
     
     ui.new_label("AA", "Anti-aimbot angles", "[deathwish]Anti-Aim Type Indicator Color Picker")
     local text_color_3 = ui.new_color_picker("AA", "Anti-aimbot angles","[deathwish]Anti-Aim Status Text Color Picker_4", 255, 255, 255, 255)
     
     ui.new_label("AA", "Anti-aimbot angles", "[deathwish]Anti-Aim Type Indicator Correction Color Picker")
     local text_color_4 = ui.new_color_picker("AA", "Anti-aimbot angles","[deathwish]Anti-Aim Status Text Color Picker_5", 255, 255, 255, 255)
     
     
     local AA_hot_angle = ui.new_hotkey("AA", "Anti-aimbot angles","[deathwish] High Angles Hotkey Bind -->")
     
     
     local aa_enable = ui.reference("AA", "Anti-aimbot angles","Enabled")
     ui.set(aa_enable,true)
     local left_hotkey = ui.new_hotkey("AA", "Anti-aimbot angles", "[deathwish]Left AA")
     local right_hotkey = ui.new_hotkey("AA", "Anti-aimbot angles", "[deathwish]Right AA")
     local Default_hotkey = ui.new_hotkey("AA", "Anti-aimbot angles", "[deathwish]Default AA")
     local legit_hotkey = ui.new_hotkey("AA", "Anti-aimbot angles", "[deathwish]Legit AA")
     
     pos = 2
     legit = 1
     
     pos_1 = 0
     client.set_event_callback("setup_command", function()
         if ui.get(legit_hotkey)then
             legit = 0
         else
             legit = 1
         end
     
         if ui.get(left_hotkey)then
             pos = 0
         elseif ui.get(right_hotkey)then
             pos = 1 
         elseif ui.get(Default_hotkey)then
             pos = 2 
         end
     
         local slow_ref,slow_hot = ui.reference("AA", "Other", "Slow motion")
         local value = entity.get_prop(entity.get_local_player(), "m_fFlags")
         if value == 256 or value == 262 then
             pos_1 = 1
         elseif value == 263 or ui.get(ui.reference("Rage", "Other", "Duck peek assist")) then
             pos_1 = 2
         elseif ui.get(slow_hot) then
             pos_1 = 3
         else
             pos_1 = 0
         end 
     end)
     
     
     client.set_event_callback("paint", function()
         local x1,y1 = client.screen_size()
         local x,y = x1/2,y1/2+50
         local r,g,b,a = ui.get(text_color)
         if legit == 0 then
             renderer.text(x, y, r, g, b, a, "cb", 0,"Legit")
         elseif pos == 0 then
             renderer.text(x, y, r, g, b, a, "cb", 0,"Left")
         elseif pos == 1 then
             renderer.text(x, y, r, g, b, a, "cb", 0,"Right")
         elseif pos_1 == 1 then
             renderer.text(x, y, r, g, b, a, "cb", 0,"Air")
         elseif pos_1 == 2 then
             renderer.text(x, y, r, g, b, a, "cb", 0,"Duck")
         elseif pos_1 == 3 then
             renderer.text(x, y, r, g, b, a, "cb", 0,"Slow Walk")
         elseif pos_1 == 0 then
             renderer.text(x, y, r, g, b, a, "cb", 0,"Moving")
         end
         local r1,g1,b1,a1 = ui.get(text_color_1)
         local r2,g2,b2,a2 = ui.get(text_color_2)
         if ui.get(AA_hot_angle)then
             renderer.text(3, y, r2, g2, b2, a2, "+", 0,"High Angels")
         else
             renderer.text(3, y, r1, g1, b1, a1, "+", 0,"Low Angels")
         end
     end)
     
     fire = 0
     client.set_event_callback("weapon_fire", function(e)
         if client.userid_to_entindex(e.userid)~=entity.get_local_player()then
             if fire == 0 then
                 fire = 1 
             elseif fire == 1 then
                 fire = 0 
             end
         end
     end)
     
      function random_cc()
              local value = client.random_int(0, 10)
              if value > 5 then
                  fire = 0
              else
                 fire = 1
              end
          end
     
         client.set_event_callback("paint", function()
              local hours, minutes, seconds, milliseconds = client.system_time() 
              if seconds == 0 or seconds == 5 or seconds == 10 or seconds == 15 or seconds == 20 or seconds == 25 or seconds == 30 or seconds == 35 or seconds == 40 or seconds == 45 or seconds == 50 or seconds == 55 then
                 if milliseconds == 50 or  milliseconds == 51 or milliseconds == 52 or milliseconds == 53 or milliseconds == 54 then
                  random_cc()
                  end
              end
          end)
     
     
     local pitch_ref= ui.reference("AA", "Anti-aimbot angles", "Pitch")
     local yaw_base_ref = ui.reference("AA", "Anti-aimbot angles", "Yaw base")
     local yaw_mode_ref,yaw_sli_ref = ui.reference("AA", "Anti-aimbot angles", "Yaw")
     local yaw_jitter_mode_ref,yaw_jitter_sli_ref = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")
     local body_yaw_mode_ref,body_yaw_sli_ref =ui.reference("AA", "Anti-aimbot angles", "Body yaw")
     local fake_yaw_limit_ref =ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")
     
     ui.set(yaw_mode_ref,"180")
     ui.set(yaw_jitter_mode_ref,"Offset")
     client.set_event_callback("paint_ui", function()
         if pos_1 ~= 1 then
             ui.set(body_yaw_mode_ref,"Static")
         else
             ui.set(body_yaw_mode_ref,"Jitter")
         end
     end)
     
     
     client.set_event_callback("setup_command",function()--legit AA
         if legit == 0 then
             ui.set(pitch_ref,"Off")
             ui.set(yaw_base_ref,"At targets")
             ui.set(yaw_sli_ref,180)
             ui.set(yaw_jitter_sli_ref,client.random_int(-8,7))
             local random = client.random_int(0, 10)
             if pos_1 ~= 2 then
             if fire == 0 then
                ui.set(body_yaw_sli_ref,-60)
                if ui.get(AA_hot_angle)then
                if random >5 then
                 ui.set(fake_yaw_limit_ref,45)
                else
                 ui.set(fake_yaw_limit_ref,client.random_int(45,58))
                end
             else
                 if random >5 then
                     ui.set(fake_yaw_limit_ref,26)
                    else
                     ui.set(fake_yaw_limit_ref,client.random_int(23,40))
                    end
             end
             elseif fire == 1 then
                 ui.set(body_yaw_sli_ref,90)
                 if ui.get(AA_hot_angle)then
                     if random >5 then
                      ui.set(fake_yaw_limit_ref,48)
                     else
                      ui.set(fake_yaw_limit_ref,client.random_int(50,60))
                     end
                  else
                      if random >5 then
                          ui.set(fake_yaw_limit_ref,22)
                         else
                          ui.set(fake_yaw_limit_ref,client.random_int(24,36))
                         end
                  end
             end
         else
             ui.set(fake_yaw_limit_ref,60)
         end
         end
     end)
     
     client.set_event_callback("paint", function()
         local x,y = client.screen_size()
         local x1,y1 = x/2-80,y/2
         local r,g,b,a =ui.get(text_color_3)
         renderer.triangle(x1-100, y1, x1-75, y1+20, x1-80, y1, r, g, b, a)
         renderer.line(x1-100, y1, x1-75, y1-20, r, g, b, a)
         renderer.line(x1-75, y1-20, x1-80, y1, r, g, b, a)
     
         local x2,y2 = x/2+80,y/2
         renderer.triangle(x2+100, y1, x2+75, y1+20, x2+80, y1, r, g, b, a)
         renderer.line(x2+100, y1, x2+75, y1-20, r, g, b, a)
         renderer.line(x2+75, y1-20, x2+80, y1, r, g, b, a)
     
         local r1,g1,b1,a1 = ui.get(text_color_4)
         if pos == 1 then
             renderer.triangle(x2+100, y1, x2+75, y1+20, x2+80, y1, r1, g1, b1, a1)
         renderer.line(x2+100, y1, x2+75, y1-20, r1, g1, b1, a1)
         renderer.line(x2+75, y1-20, x2+80, y1, r1, g1, b1, a1)
         elseif pos == 0 then
             renderer.triangle(x1-100, y1, x1-75, y1+20, x1-80, y1, r1, g1, b1, a1)
         renderer.line(x1-100, y1, x1-75, y1-20, r1, g1, b1, a1)
         renderer.line(x1-75, y1-20, x1-80, y1, r1, g1, b1, a1)
         end
     end)
     
     client.set_event_callback("setup_command", function()--l r
         if legit~= 0 then
             if pos ==1 then
                 ui.set(pitch_ref,"Default")
                 ui.set(yaw_base_ref,"Local view")
                 ui.set(yaw_sli_ref,90)
             elseif pos == 0 then
                 ui.set(pitch_ref,"Default")
                 ui.set(yaw_base_ref,"Local view")
                 ui.set(yaw_sli_ref,-90)
             elseif pos == 2 then
                 ui.set(pitch_ref,"Default")
                 ui.set(yaw_base_ref,"At targets")
             end
         end
     end)
     
     client.set_event_callback("setup_command", function()--in the air AA
         if legit~= 0 then
             if pos_1 == 1 then
                 if pos == 2 then
                     ui.set(yaw_sli_ref,0)
                 end
                 ui.set(yaw_jitter_sli_ref,client.random_int(-5, 7))
                 if fire == 0 then
                 ui.set(body_yaw_sli_ref,95)
                 else
                     ui.set(body_yaw_sli_ref,-65)
                 end
                 local random = client.random_int(0, 10)
                 if ui.get(AA_hot_angle)then
                     if random >5 then
                         ui.set(fake_yaw_limit_ref,48)
                     else
                         ui.set(fake_yaw_limit_ref,client.random_int(44,56))
                     end
                 else
                     if random >5 then
                         ui.set(fake_yaw_limit_ref,33)
                     else
                         ui.set(fake_yaw_limit_ref,client.random_int(28,42))
                     end
                 end
             end
         end
     end)
     
     client.set_event_callback("setup_command", function()--duck AA
         if legit~= 0 then
             if pos_1 == 2 then
                 if pos == 2 then
                     ui.set(yaw_sli_ref,client.random_int(-4,3))
                 end
                 ui.set(yaw_jitter_sli_ref,8)
                 if fire == 0 then
                 ui.set(body_yaw_sli_ref,105)
                 else
                     ui.set(body_yaw_sli_ref,-85)
                 end
                 ui.set(fake_yaw_limit_ref,60)
             end
         end
     end)
     
     
     client.set_event_callback("setup_command", function()--slow walk AA
         if legit~= 0 then
             if pos_1 == 3 then
                 if pos == 2 then
                     ui.set(yaw_sli_ref,0)
                 end
                 ui.set(yaw_jitter_sli_ref,4)
                 if fire == 0 then
                 ui.set(body_yaw_sli_ref,-90)
                 else
                     ui.set(body_yaw_sli_ref,105)
                 end
                 local random = client.random_int(0, 10)
                 if ui.get(AA_hot_angle)then
                     if random >5 then
                         ui.set(fake_yaw_limit_ref,52)
                     else
                         ui.set(fake_yaw_limit_ref,client.random_int(48,60))
                     end
                 else
                     if random >5 then
                         ui.set(fake_yaw_limit_ref,26)
                     else
                         ui.set(fake_yaw_limit_ref,client.random_int(26,37))
                     end
                 end
             end
         end
     end)
     
     client.set_event_callback("setup_command", function()--moving AA
         if legit~= 0 then
             if pos_1 == 0 then
                 if pos == 2 then
                     ui.set(yaw_sli_ref,client.random_int(-3, 4))
                 end
                 ui.set(yaw_jitter_sli_ref,3)
                 if fire == 0 then
                 ui.set(body_yaw_sli_ref,-60)
                 else
                     ui.set(body_yaw_sli_ref,90)
                 end
                 local random = client.random_int(0, 10)
                 if ui.get(AA_hot_angle)then
                     if random >5 then
                         ui.set(fake_yaw_limit_ref,55)
                     else
                         ui.set(fake_yaw_limit_ref,client.random_int(42,60))
                     end
                 else
                     if random >5 then
                         ui.set(fake_yaw_limit_ref,33)
                     else
                         ui.set(fake_yaw_limit_ref,client.random_int(33,47))
                     end
                 end
             end
         end
     end)