const weapon =new Array("General","SCAR20","G3SG1","AWP","Revolver","Deagle","USP","Glock","Dualies","AK47","P2000","Five Seven","Tec-9","P250","CZ-75","Mac10","P90","MP5","MP7","MP9","UMP45","PP-Bizon","M4A1-S","M4A4","AK47","AUG","SG553","FAMAS","GALIL","Negev","M249","XM1014","MAG7","Sawed off","Nova","SSG08");
const type = new Array("Visible","Autowall","Minimum","Airing");
const hitbox = ["Head","Upper chest","Chest","Lower chest","Stomach","Pelvis","Legs","Feet","Arms"];
const Type = ["Visible","Autowall","Minimum","Airing"];
const auto_stop = ["Duck","Early","On center only","Lethal only","Visible only","In air","Between shots","Force accuracy"];

UI.AddSubTab( ["Rage","SUBTAB_MGR"], "Map1e" );
UI.AddHotkey(["Rage","General","Key assignment"],"[Map1e]Minimum Damage Override","Minimum Damage");



function real_ui(){
    for (i=0;i<weapon.length;i++){
        if (UI.GetString( ["Rage","Target",weapon[i],"["+weapon[i]+"] Type Settings"])=="Visible"){
            for (var c = 1 ; c<type.length;c++){
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum damage"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum Hit Chance"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Hitboxes"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Multipoint Hitboxes"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Head point scale"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Body point scale"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Auto Stop"], 0 )
            }
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum damage"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum Hit Chance"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Hitboxes"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Multipoint Hitboxes"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Head point scale"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Body point scale"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Auto Stop"], 1 )
        }
        else if (UI.GetString( ["Rage","Target",weapon[i],"["+weapon[i]+"] Type Settings"])=="Autowall"){
            for (var c = 2 ; c<type.length;c++){
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum damage"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum Hit Chance"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Hitboxes"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Multipoint Hitboxes"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Head point scale"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Body point scale"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Auto Stop"], 0 )
            }
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum damage"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum Hit Chance"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Hitboxes"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Multipoint Hitboxes"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Head point scale"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Body point scale"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Auto Stop"], 0 )

            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Minimum damage"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Minimum Hit Chance"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Hitboxes"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Multipoint Hitboxes"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Head point scale"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Body point scale"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Auto Stop"], 1 )
        }
        else if (UI.GetString( ["Rage","Target",weapon[i],"["+weapon[i]+"] Type Settings"])=="Minimum"){
            for (var c = 3 ; c<type.length;c++){
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum damage"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum Hit Chance"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Hitboxes"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Multipoint Hitboxes"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Head point scale"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Body point scale"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Auto Stop"], 0 )
            }
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum damage"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum Hit Chance"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Hitboxes"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Multipoint Hitboxes"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Head point scale"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Body point scale"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Auto Stop"], 0 )

            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Minimum damage"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Minimum Hit Chance"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Hitboxes"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Multipoint Hitboxes"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Head point scale"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Body point scale"], 0 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Auto Stop"], 0 )

            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Minimum damage"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Minimum Hit Chance"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Hitboxes"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Multipoint Hitboxes"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Head point scale"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Body point scale"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Auto Stop"], 1 )
        }
        else{
            for (var c = 0 ; c<3;c++){
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum damage"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum Hit Chance"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Hitboxes"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Multipoint Hitboxes"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Head point scale"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Body point scale"], 0 )
                UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Auto Stop"], 0 )
            }
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Minimum damage"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Minimum Hit Chance"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Hitboxes"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Multipoint Hitboxes"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Head point scale"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Body point scale"], 1 )
            UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Auto Stop"], 1 )
        }
    }
}

function ui_set_2(){
    for (i=0;i<weapon.length;i++){
        UI.SetValue(["Rage","Accuracy",weapon[i],"Disable autowall"],UI.GetValue(["Rage","Map1e","Map1e","[Map1e] Disabled Auto Penetration" ]))
        UI.SetValue(["Rage","Target",weapon[i],"Field of view"],UI.GetValue(["Rage","Map1e","Map1e","Weapon FOV"]))
    }
}

function ui_sub_add(){
    var b = UI.AddSliderInt(["Rage","Map1e","Map1e"] , "Weapon FOV", 0, 180 )
    var c = UI.AddCheckbox(["Rage","Map1e","Map1e"], "[Map1e] Disabled Auto Penetration" )
    UI.RegisterCallback( b, "ui_set_2" )
    UI.RegisterCallback( c, "ui_set_2" )
    for (var i=0;i<weapon.length;i++){
        var a = UI.AddDropdown( ["Rage","Target",weapon[i]], "["+weapon[i]+"] Type Settings", Type, 0 )
        UI.RegisterCallback(a, "real_ui" )
        UI.AddCheckbox(["Rage","Target",weapon[i]],  "["+weapon[i]+"] Auto stop" )
        UI.AddCheckbox(["Rage","Target",weapon[i]],  "["+weapon[i]+"] Prefer safe point" )
        UI.AddCheckbox(["Rage","Target",weapon[i]],  "["+weapon[i]+"] Prefer body aim" )
        for (var c = 0 ; c<type.length;c++){
            UI.AddSliderInt(["Rage","Target",weapon[i]] , "["+weapon[i]+"] "+type[c]+" Minimum damage", 0, 130 )
            UI.AddSliderInt(["Rage","Target",weapon[i]] , "["+weapon[i]+"] "+type[c]+" Minimum Hit Chance", 0, 100 )
            UI.AddMultiDropdown(["Rage","Target",weapon[i]], "["+weapon[i]+"] "+type[c]+" Hitboxes", hitbox)
            UI.AddMultiDropdown(["Rage","Target",weapon[i]], "["+weapon[i]+"] "+type[c]+" Multipoint Hitboxes", hitbox)
            UI.AddSliderInt(["Rage","Target",weapon[i]] , "["+weapon[i]+"] "+type[c]+" Head point scale", 0, 100 )
            UI.AddSliderInt(["Rage","Target",weapon[i]] , "["+weapon[i]+"] "+type[c]+" Body point scale", 0, 100 )
            UI.AddMultiDropdown(["Rage","Target",weapon[i]], "["+weapon[i]+"] "+type[c]+" Auto Stop", auto_stop)
        }
    }
}
ui_sub_add()

real_ui()

  function ui_set_vis(){
    for (i=0;i<weapon.length;i++){
        UI.SetEnabled(["Rage","Target",weapon[i],"Field of view"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Minimum damage"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Hitboxes"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Multipoint hitboxes"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Head pointscale"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Body pointscale"], 0 )

        
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Hitchance"], 0 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Auto stop"], 0 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Auto stop modifiers"], 0 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Prefer safe point"], 0 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Prefer body aim"], 0 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Disable autowall"], 0 )
    }
}
ui_set_vis()


function ui_set_visi(){
    for (i=0;i<weapon.length;i++){
        UI.SetEnabled(["Rage","Target",weapon[i],"Field of view"], 1 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Minimum damage"], 1 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Hitboxes"], 1 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Multipoint hitboxes"], 1 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Head pointscale"], 1 )
        UI.SetEnabled(["Rage","Target",weapon[i],"Body pointscale"], 1 )

        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Hitchance"], 1 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Auto stop"], 1 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Auto stop modifiers"], 1 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Prefer safe point"], 1 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Prefer body aim"], 1 )
        UI.SetEnabled(["Rage","Accuracy",weapon[i],"Disable autowall"], 1 )
    }
}
Cheat.RegisterCallback("Unload", "ui_set_visi")  
function ui_set(){
    for (var i=0;i<weapon.length;i++){
        UI.SetValue( ["Rage","Accuracy",weapon[i],"Auto stop"], UI.GetValue( ["Rage","Target",weapon[i], "["+weapon[i]+"] Auto stop"] ) )
        UI.SetValue( ["Rage","Accuracy",weapon[i],"Prefer safe point"], UI.GetValue( ["Rage","Target",weapon[i], "["+weapon[i]+"] Prefer safe point"] ) )
        UI.SetValue( ["Rage","Accuracy",weapon[i],"Prefer body aim"], UI.GetValue( ["Rage","Target",weapon[i], "["+weapon[i]+"] Prefer body aim"] ) )
    }
}
Cheat.RegisterCallback("CreateMove", "ui_set")

function cc(){
    for (i=0;i<weapon.length;i++){
    for (var c = 1 ; c<type.length;c++){
        UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum damage"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Minimum Hit Chance"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Hitboxes"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Multipoint Hitboxes"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Head point scale"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Body point scale"], 0 )
        UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[c]+" Auto Stop"], 0 )
    }
    UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum damage"], 1 )
    UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum Hit Chance"], 1 )
    UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Hitboxes"], 1 )
    UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Multipoint Hitboxes"], 1 )
    UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Head point scale"], 1 )
    UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Body point scale"], 1 )
    UI.SetEnabled(["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Auto Stop"], 1 )
}
}
cc()



const visi = 1;

function is_entity_visible( me, entity, extrapolate ) {

    /**
     * @param Number entity
     * @param Number[3] position
     */
    const extrapolate = function( entity, position ) {
        const velocity = Entity.GetProp( entity, "CBasePlayer", "m_vecVelocity[0]" );
        position[ 0 ] += velocity[ 0 ];
        position[ 1 ] += velocity[ 1 ];
        position[ 2 ] += velocity[ 2 ];

        return position;
    };
    const hitbox_positions = [  ];
    const hitboxes = [ 0, 3, 5, 11, 12, 13, 14 ];
    const origin = Entity.GetEyePosition( me );
    for ( var i = 0; i < hitboxes.length; i++ ) {
        const hitbox = hitboxes[ i ];
        hitbox_positions[ hitbox ] = Entity.GetHitboxPosition( entity, hitbox );

        const trace = Trace.Line( me, origin, hitbox_positions[ hitbox ] );

        if ( !trace )
            continue;

        if ( trace[1] > 0.95 )
            return true;         
    }
    if ( !extrapolate )
        return false;
    const extrapolate_hitboxes = [ 0, 3, 5 ];

    for ( var i = 0; i < extrapolate_hitboxes.length; i++ ) {
        const hitbox = extrapolate_hitboxes[ i ];
        const trace = Trace.Line( me, origin, extrapolate( entity, hitbox_positions[ hitbox ] ) );
        if ( !trace )
            continue;

        if ( trace[1] > 0.95 )
            return true;
    }
    return false;
}

function right(){
    const me = Entity.GetLocalPlayer()
    const enemies = Entity.GetEnemies()
    for ( i = 0; i < enemies.length; i++ ) {
        const vis = is_entity_visible( me, enemies[ i ], false )
    }
    if (vis){visi = 0 }
    else{visi = 1}
}

Cheat.RegisterCallback( "CreateMove", "right" )


function set_ui(){
	var value = Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_fFlags" )
    if (UI.GetValue( ["Rage","General","Key assignment","[Map1e]Minimum Damage Override"])){
        for (i=0;i<weapon.length;i++){
                UI.SetValue( ["Rage","Target",weapon[i],"Minimum damage"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Minimum damage"] ) )
                UI.SetValue( ["Rage","Target",weapon[i],"Head pointscale"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Head point scale"] ) )
                UI.SetValue( ["Rage","Target",weapon[i],"Body pointscale"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Body point scale"] ) )
                UI.SetValue( ["Rage","Accuracy",weapon[i],"Hitchance"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Minimum Hit Chance"] ) )
                UI.SetValue( ["Rage","Target",weapon[i],"Hitboxes"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Hitboxes"] ) )
                UI.SetValue( ["Rage","Target",weapon[i],"Multipoint hitboxes"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Multipoint Hitboxes"] ) )
                UI.SetValue( ["Rage","Accuracy",weapon[i],"Auto stop modifiers"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[2]+" Auto Stop"] ) )
        }
    }
    else if (value == 262 || value == 256){
        for (i=0;i<weapon.length;i++){
        UI.SetValue( ["Rage","Target",weapon[i],"Minimum damage"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Minimum damage"] ) )
                UI.SetValue( ["Rage","Target",weapon[i],"Head pointscale"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Head point scale"] ) )
                UI.SetValue( ["Rage","Target",weapon[i],"Body pointscale"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Body point scale"] ) )
                UI.SetValue( ["Rage","Accuracy",weapon[i],"Hitchance"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Minimum Hit Chance"] ) )
                UI.SetValue( ["Rage","Target",weapon[i],"Hitboxes"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Hitboxes"] ) )
                UI.SetValue( ["Rage","Target",weapon[i],"Multipoint hitboxes"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Multipoint Hitboxes"] ) )
                
        UI.SetValue( ["Rage","Accuracy",weapon[i],"Auto stop modifiers"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[3]+" Auto Stop"] ) )
        }
    }
    else if (visi == 0){
        for (i=0;i<weapon.length;i++){
        UI.SetValue( ["Rage","Target",weapon[i],"Minimum damage"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum damage"] ) )
        UI.SetValue( ["Rage","Target",weapon[i],"Head pointscale"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Head point scale"] ) )
        UI.SetValue( ["Rage","Target",weapon[i],"Body pointscale"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Body point scale"] ) )
        UI.SetValue( ["Rage","Accuracy",weapon[i],"Hitchance"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Minimum Hit Chance"] ) )
        UI.SetValue( ["Rage","Target",weapon[i],"Hitboxes"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Hitboxes"] ) )
        UI.SetValue( ["Rage","Target",weapon[i],"Multipoint hitboxes"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Multipoint Hitboxes"] ) )
        UI.SetValue( ["Rage","Accuracy",weapon[i],"Auto stop modifiers"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[0]+" Auto Stop"] ) )
    
        }
    }
    else{
        for (i=0;i<weapon.length;i++){
        UI.SetValue( ["Rage","Target",weapon[i],"Minimum damage"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Minimum damage"] ) )
        UI.SetValue( ["Rage","Target",weapon[i],"Head pointscale"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Head point scale"] ) )
        UI.SetValue( ["Rage","Target",weapon[i],"Body pointscale"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Body point scale"] ) )
        UI.SetValue( ["Rage","Accuracy",weapon[i],"Hitchance"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Minimum Hit Chance"] ) )
        UI.SetValue( ["Rage","Target",weapon[i],"Hitboxes"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Hitboxes"] ) )
        UI.SetValue( ["Rage","Target",weapon[i],"Multipoint hitboxes"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Multipoint Hitboxes"] ) )
        
        
        UI.SetValue( ["Rage","Accuracy",weapon[i],"Auto stop modifiers"], UI.GetValue( ["Rage","Target",weapon[i],"["+weapon[i]+"] "+type[1]+" Auto Stop"] ) )
        }
    }
}
Cheat.RegisterCallback( "CreateMove", "set_ui" )

Cheat.RegisterCallback( "CreateMove", "ui_set_2" )
ui_set_2()


const Cheat_PrintColor = Cheat.PrintColor;
hitboxes = [
    '身体',
    '头',
    '胸部',
    '胃',
    '左臂',
    '右臂',
    '左腿',
    '右腿',
    '身体'
];
var shots = 0;
var predicthc = 0;
var safety = 0;
var hitboxName = "";
var choked = 0;
var exploit = 0;
var logs = [];
var logsct = [];
var logsalpha = [];
function getHitboxName(index)
{
    switch (index)
    {
        case 0:
            hitboxName = "头";
            break;
        case 1:
            hitboxName = "脖颈";
            break;
        case 2:
            hitboxName = "手臂";
            break;
        case 3:
            hitboxName = "身体";
            break;
        case 4:
            hitboxName = "胸腔";
            break;
        case 5:
            hitboxName = "胸部";
            break;
        case 6:
            hitboxName = "上胸部";
            break;
        case 7:
            hitboxName = "左大腿";
            break;
        case 8:
            hitboxName = "右大腿";
            break;
        case 9:
            hitboxName = "左小腿";
            break;
        case 10:
            hitboxName = "右小腿";
            break;
        case 11:
            hitboxName = "左脚";
            break;
        case 12:
            hitboxName = "右脚";
            break;
        case 13:
            hitboxName = "左手";
            break;
        case 14:
            hitboxName = "右手";
            break;
        case 15:
            hitboxName = "左上臂";
            break;
        case 16:
            hitboxName = "左前臂";
            break;
        case 17:
            hitboxName = "右上臂";
            break;
        case 18:
            hitboxName = "右前臂";
            break;
        default:
            hitboxName = "身体";
    }
    return hitboxName;
}
function HitgroupName(index) {
    return hitboxes[index] || 'body';
}

var target = -1;
var shots_fired = 0;
var hits = 0;
var lastUpdate = 0;
var logged = false;

function ragebot_fire() {
    predicthc = Event.GetInt("hitchance");
    safety = Event.GetInt("safepoint");
    hitboxName = getHitboxName(Event.GetInt("hitbox"));
    exploit = (Event.GetInt("exploit")+1).toString();
  targetc = Event.GetInt("target_index");
  shots_fired++;
  logged = false;
  lastUpdate = Globals.Curtime();
}

function hitlog() {
    var hit = Entity.GetEntityFromUserID(Event.GetInt("userid"));
    var attacker = Entity.GetEntityFromUserID(Event.GetInt("attacker"));
    if (attacker == Entity.GetLocalPlayer() && hit == targetc) hits++;

    var hittype = "对 ";
    var me = Entity.GetLocalPlayer();
    var hitbox = Event.GetInt('hitgroup');
    target_damage = Event.GetInt("dmg_health");
    target_health = Event.GetInt("health");
    victim = Event.GetInt('userid');
    attacker = Event.GetInt('attacker');
    var weapon_c = Event.GetString('weapon');
    victimIndex = Entity.GetEntityFromUserID(victim);
    attackerIndex = Entity.GetEntityFromUserID(attacker);
    name = Entity.GetName(victimIndex);
      var simtime = Globals.Tickcount() % 17;

    var flags = "";

    if (exploit == 2)
      flags += "T";

    flags += "B";

    if (hitbox == 1)
      flags += "H";

      if (safety == 1) {
          safety = "已解析";
      }
      else {
          safety = "未解析";
      }

    if (weapon_c == "hegrenade")
      hittype = "用手雷对 ";
    else if (weapon_c == "inferno")
      hittype = "用燃烧弹对 ";
    else if (weapon_c == "knife")
      hittype = "用匕首对 ";
    if (me == attackerIndex && me != victimIndex) {
        
    if (hittype == "对 ") {
       if (target_health.toString()==0){
Cheat.PrintChat(" \x08[\x0dMap1e\x08]\x10>>\x06"+"解析成功"+"\x08 "+hittype+"\x0f"+name+"\x08的 \x10"+HitgroupName(hitbox)+"\x0e 造成了 \x07"+target_damage.toString()+"伤害"+"\x08 ("+"\x05敌方已死亡"+"\x08) 解析部位：\x10"+hitboxName+" \x08命中几率："+"\x01"+predicthc.toString()+"% "+"\n");
}
else{

Cheat.PrintChat(" \x08[\x0dMap1e\x08]\x10>>\x06"+"解析成功"+"\x08 "+hittype+"\x0f"+name+"\x08的 \x10"+HitgroupName(hitbox)+"\x0e 造成了 \x07"+target_damage.toString()+"伤害"+"\x08 ("+"\x05血量剩余："+target_health.toString()+"\x08) 解析部位：\x10"+hitboxName+" \x08命中几率："+"\x01"+predicthc.toString()+"% "+"\n");

           
        }
      
    }
    else {
if (target_health.toString()==0){
Cheat.PrintChat("\x08["+"\x0dMap1e"+"\x08] "+hittype+"\x0f"+name+"\x08的\x10 "+HitgroupName(hitbox)+" \x0e造成了 \x07"+target_damage.toString()+"伤害 \x08(\x06敌方已死亡"+"\x08) \n");
          logs.push("["+shots.toString()+"] "+hittype+name+"'s "+HitgroupName(hitbox)+" for "+target_damage.toString()+" ("+target_health.toString()+" remaining)");
}
else{
      Cheat.PrintChat("\x08["+"\x0dMap1e"+"\x08] "+hittype+"\x0f"+name+"\x08的\x10 "+HitgroupName(hitbox)+" \x0e造成了 \x07"+target_damage.toString()+"伤害 \x08(\x06血量剩余："+target_health.toString()+"\x08) \n");
          logs.push("["+shots.toString()+"] "+hittype+name+"'s "+HitgroupName(hitbox)+" for "+target_damage.toString()+" ("+target_health.toString()+" remaining)");
}
    }

        logsct.push(Globals.Curtime());
        logsalpha.push(255);
    }

  if (shots == 99)
    shots = 0;
  else
    shots++;

}

function removelogs() {
    if (logs.length > 6) {
        logs.shift();
        logsct.shift();
        logsalpha.shift();
    }

    if (logsct[0] + 6.5 < Globals.Curtime()) {
        logsalpha[0] -= Globals.Frametime() * 600;
        if (logsalpha[0] < 0) {
            logs.shift();
            logsct.shift();
            logsalpha.shift();
        }
    }
}


function onDraw() {
    if (!World.GetServerString()) return;
    var font = Render.GetFont("Arial.ttf", 12, true);


    for (i = 0; i < logs.length; i++) {
        Render.String(4, 4 + 13*i, 0, logs[i], [0, 0, 0, logsalpha[i]], font);
        Render.String(3, 3 + 13*i, 0, logs[i], [255, 255, 255, logsalpha[i]], font);
    }

    if (shots_fired > hits && (Globals.Curtime() - lastUpdate > 0.33)) {
      if (Globals.Curtime() - lastUpdate > 1) {
        shots_fired = 0;
        hits = 0;
      }
      if (!logged) {
        var simtime = Globals.Tickcount() % 16;
        logged = true;
        var issafe = "已解析";
        var reason = "空解析";
        if (safety == 0) {
          issafe = "未解析";
        }

        if (Entity.IsAlive(targetc) == false)
            reason = "开枪前敌方已死亡";
        else if (Entity.IsAlive(Entity.GetLocalPlayer()) == false)
            reason = "你已死亡";
        else if (safety == true && predicthc < 76)
            reason = "空扩散";
        else if (safety == true && predicthc > 76)
            reason = "解析错误";

        var flags = "";

        if (exploit == 2)
          flags += "T";

          flags += "B";

        
            
                Cheat.PrintChat(" \x08[\x0dMap1e\x08]\x10>> \x0f"+"解析失败"+"\x08 "+"\x08空了 "+"\x03" + Entity.GetName(targetc)  +"\x08的 \x10"+hitboxName+"\x08(\x06命中几率："+"\x06"+predicthc.toString()+"%\x08) \x08原因：\x07"+reason+"。\x08");
            
        logsct.push(Globals.Curtime());
            logsalpha.push(255);
        if (shots == 99)
          shots = 0;
        else
          shots++;
      }
    }
}

function main() {
    Global.RegisterCallback("ragebot_fire", "ragebot_fire");
  Global.RegisterCallback("player_hurt", "hitlog");
    Global.RegisterCallback("Draw", "onDraw");
    Global.RegisterCallback("Draw", "removelogs");
}

main();



function fk_vis(){
	if (UI.GetString(fakelag)=="Airing"){
		for (i=1;i<fk_t.length;i++){
			UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Minimum Limit"], 0 )
			UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Maximum Limit"], 0 )
		}
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Minimum Limit"], 1 )
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Maximum Limit"], 1 )
	}
	else if (UI.GetString(fakelag)=="Moving"){
		for (i=2;i<fk_t.length;i++){
			UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Minimum Limit"], 0 )
			UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Maximum Limit"], 0 )
		}
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Minimum Limit"], 0 )
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Maximum Limit"], 0 )

		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[1]+"] Fake Lag Minimum Limit"], 1)
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[1]+"] Fake Lag Maximum Limit"], 1 )
	}
	else if (UI.GetString(fakelag)=="Crouching"){
		for (i=2;i<fk_t.length;i++){
			UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Minimum Limit"], 0 )
			UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Maximum Limit"], 0 )
		}
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Minimum Limit"], 0 )
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Maximum Limit"], 0 )

		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[1]+"] Fake Lag Minimum Limit"], 0 )
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[1]+"] Fake Lag Maximum Limit"],0 )

		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[2]+"] Fake Lag Minimum Limit"], 1 )
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[2]+"] Fake Lag Maximum Limit"], 1 )
	}
	else{
		for (i=0;i<fk_t.length-1;i++){
			UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Minimum Limit"], 0 )
			UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Maximum Limit"], 0 )
		}
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[3]+"] Fake Lag Minimum Limit"], 1 )
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[3]+"] Fake Lag Maximum Limit"], 1 )
	}
}


var fakelag = UI.AddDropdown( ["Rage","Map1e","Map1e"], "Fake Lag Type", ["Airing","Moving","Crouching","Peeking"],0 )
UI.RegisterCallback(fakelag, "fk_vis")
const fk_t = new Array("Airing","Moving","Crouching","Peeking");
function fake_ui_add(){
	for (i=0;i<fk_t.length;i++){
		UI.AddSliderInt( ["Rage","Map1e","Map1e"], "["+fk_t[i]+"] Fake Lag Minimum Limit", 0, 14)
		UI.AddSliderInt( ["Rage","Map1e","Map1e"], "["+fk_t[i]+"] Fake Lag Maximum Limit", 0, 14)
	}
}
fake_ui_add()

function set_vis_fk(){
	for (i=1;i<fk_t.length;i++){
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Minimum Limit"], 0 )
		UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[i]+"] Fake Lag Maximum Limit"], 0 )
	}
	UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Minimum Limit"], 1 )
	UI.SetEnabled( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Maximum Limit"], 1 )
}

set_vis_fk()


function randomNum(minNum,maxNum){ 
    switch(arguments.length){ 
        case 1: 
            return parseInt(Math.random()*minNum+1,10); 
        break; 
        case 2: 
            return parseInt(Math.random()*(maxNum-minNum+1)+minNum,10); 
        break; 
            default: 
                return 0; 
            break; 
    } 
} 


function set_fk_value(){
	var lim = Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_fFlags" )
	if (Autostop.IsAutoPeeking()){
		UI.SetValue( ["Rage","Fake Lag","Limit"],randomNum(UI.GetValue( ["Rage","Map1e","Map1e","["+fk_t[3]+"] Fake Lag Minimum Limit"] ),UI.GetValue( ["Rage","Map1e","Map1e","["+fk_t[3]+"] Fake Lag Maximum Limit"] )))
	}
	else if (lim ==256 || lim == 262){
		UI.SetValue( ["Rage","Fake Lag","Limit"],randomNum(UI.GetValue( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Minimum Limit"] ),UI.GetValue( ["Rage","Map1e","Map1e","["+fk_t[0]+"] Fake Lag Maximum Limit"] )))
	}
	else if (lim ==263 || lim == 261){
		UI.SetValue( ["Rage","Fake Lag","Limit"],randomNum(UI.GetValue( ["Rage","Map1e","Map1e","["+fk_t[2]+"] Fake Lag Minimum Limit"] ),UI.GetValue( ["Rage","Map1e","Map1e","["+fk_t[2]+"] Fake Lag Maximum Limit"] )))
	}
	else{
		UI.SetValue( ["Rage","Fake Lag","Limit"],randomNum(UI.GetValue( ["Rage","Map1e","Map1e","["+fk_t[1]+"] Fake Lag Minimum Limit"] ),UI.GetValue( ["Rage","Map1e","Map1e","["+fk_t[1]+"] Fake Lag Maximum Limit"] )))
	}
}
Cheat.RegisterCallback( "CreateMove", "set_fk_value")

Exploit.OverrideTolerance(1)
Exploit.OverrideShift(16)

var color = UI.AddColorPicker( ["Rage","Map1e","Map1e"], "FakaLag Indicator Color Picker" )
const p = 0 ;
fk_ar = new Array(0,0,0,0,0);
function un_draw(){
	if (p>5){p = 0}
	else{p = p + 1 }
	fk_ar[p] = UI.GetValue(["Rage","Fake Lag","Limit"]);
	var co = UI.GetColor( color )
	var font = Render.GetFont( "comicbd.ttf", 30, true)
    Render.String(30,800,0, "Fl: "+fk_ar[0]+" > "+fk_ar[1]+" > "+fk_ar[2]+" > "+fk_ar[3]+" > "+fk_ar[4],co, font)

	if (UI.GetValue( ["Rage","Exploits","Keys","Key assignment","Double tap"])){
	var char = Exploit.GetCharge()
	Render.String(30,750,0, "DT",co, font)
	Render.FilledRect( 30,790, 40*char, 5, co )
	}
}

Cheat.RegisterCallback( "Draw", "un_draw")





 
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Anti-Aim mode", ["Global", "Standing", "Slow Motion", "Moving", "In Air"], 0);
 
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Yaw jitter", ["-", "Random", "Centered", "Offset"], 0);
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Jitter limit", -180, 180)
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Body yaw", ["-", "Opposite", "Freestanding", "Reversed freestanding", "Jitter", "Anti-bruteforce"], 0);
UI.AddCheckbox(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Jitter when vulnerable");
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Fake yaw limit", 0, 60)
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Randomize limit", 0, 60)
 
UI.AddCheckbox(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Enable Standing");
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Standing Yaw jitter", ["-", "Random", "Centered", "Offset"], 0);
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Standing Jitter limit", -180, 180)
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Standing Body yaw", ["-", "Opposite", "Freestanding", "Reversed freestanding", "Jitter", "Anti-bruteforce"], 0);
UI.AddCheckbox(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Standing Jitter when vulnerable");
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Standing Fake yaw limit", 0, 60)
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Standing Randomize limit", 0, 60)
 
UI.AddCheckbox(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Enable Slow Motion");
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Slow Motion Yaw jitter", ["-", "Random", "Centered", "Offset"], 0);
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Slow Motion Jitter limit", -180, 180)
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Slow Motion Body yaw", ["-", "Opposite", "Freestanding", "Reversed freestanding", "Jitter", "Anti-bruteforce"], 0);
UI.AddCheckbox(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Slow Motion Jitter when vulnerable");
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Slow Motion Fake yaw limit", 0, 60)
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Slow Motion Randomize limit", 0, 60)
 
UI.AddCheckbox(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Enable Moving");
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Moving Yaw jitter", ["-", "Random", "Centered", "Offset"], 0);
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Moving Jitter limit", -180, 180)
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Moving Body yaw", ["-", "Opposite", "Freestanding", "Reversed freestanding", "Jitter", "Anti-bruteforce"], 0);
UI.AddCheckbox(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Moving Jitter when vulnerable");
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Moving Fake yaw limit", 0, 60)
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"Moving Randomize limit", 0, 60)
 
UI.AddCheckbox(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "Enable In Air");
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "In Air Yaw jitter", ["-", "Random", "Centered", "Offset"], 0);
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"In Air Jitter limit", -180, 180)
UI.AddDropdown(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "In Air Body yaw", ["-", "Opposite", "Freestanding", "Reversed freestanding", "Jitter", "Anti-bruteforce"], 0);
UI.AddCheckbox(["Rage", "Map1e", "SHEET_MGR", "Map1e"], "In Air Jitter when vulnerable");
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"In Air Fake yaw limit", 0, 60)
UI.AddSliderInt(["Rage", "Map1e", "SHEET_MGR", "Map1e"],"In Air Randomize limit", 0, 60)
 
function menu(){
	tab=UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Anti-Aim mode"]),
	0==tab&&(UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Yaw jitter"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Body yaw"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter when vulnerable"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Randomize limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Fake yaw limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Standing"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Slow Motion"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Moving"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable In Air"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Fake yaw limit"],0)),1==tab&&(UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Standing"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Yaw jitter"],1),
  UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Randomize limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Body yaw"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter when vulnerable"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Fake yaw limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Slow Motion"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Moving"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable In Air"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Fake yaw limit"],0)),2==tab&&(UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Standing"],0),
  UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Randomize limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Slow Motion"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Yaw jitter"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Body yaw"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter when vulnerable"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Fake yaw limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Moving"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable In Air"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Fake yaw limit"],0)),3==tab&&(UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Standing"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Yaw jitter"],0),
  UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Randomize limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Slow Motion"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Moving"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Yaw jitter"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Body yaw"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter when vulnerable"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Fake yaw limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable In Air"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Fake yaw limit"],0)),4==tab&&(UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Fake yaw limit"],0),
  UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Randomize limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Randomize limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Standing"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Standing Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Slow Motion"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable Moving"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Yaw jitter"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Body yaw"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter when vulnerable"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Moving Fake yaw limit"],0),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","Enable In Air"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Yaw jitter"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter limit"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Body yaw"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter when vulnerable"],1),
 UI.SetEnabled(["Rage","Map1e","SHEET_MGR","Map1e","In Air Fake yaw limit"],1))}
 
function getvelocity(index) {
    var velocity = Entity.GetProp(index, "CBasePlayer", "m_vecVelocity[0]");
    return Math.sqrt(velocity[0] * velocity[0] + velocity[1] * velocity[1]);
}
function DEG2RAD(degree) {
    return (Math.PI / 180) * degree;
}
 
function ANGLE2VEC(angle) {
    pitch = angle[0];
    yaw = angle[1];
    return [Math.cos(DEG2RAD(pitch)) * Math.cos(DEG2RAD(yaw)), Math.cos(DEG2RAD(pitch)) * Math.sin(DEG2RAD(yaw)), -Math.sin(DEG2RAD(pitch))];
}
 
function getWallDistance(entity, angle) {
    vector = ANGLE2VEC(angle);
    origin = Entity.GetRenderOrigin(entity);
    origin[2] += Entity.GetProp(entity, "CBasePlayer", "m_vecViewOffset[2]")[0];
    end = [origin[0] + vector[0] * 8192, origin[1] + vector[1] * 8192, origin[2] + vector[2] * 8192];
    result = Trace.Line(entity, origin, end);
    if (result[1] != 1) {
        wall = [origin[0] + vector[0] * result[1] * 8192, origin[1] + vector[1] * result[1] * 8192, origin[2] + vector[2] * result[1] * 8192];
        distance = Math.sqrt(Math.pow(origin[0] - wall[0], 2) + Math.pow(origin[1] - wall[1], 2) + Math.pow(origin[2] - wall[2], 2));
        return distance;
    } else {
        return 0;
    }
}
 
function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
}
 
var antiaim = [
	global_real = 0,
	global_fake = 0,
	global_lby = 0,
 
	global_new_real = 0,
	global_new_fake = 0,
	global_new_lby = 0,
 
	standing_real = 0,
	standing_fake = 0,
	standing_lby = 0,
 
	standing_new_real = 0,
	standing_new_fake = 0,
	standing_new_lby = 0,
 
	slowmotion_real = 0,
	slowmotion_fake = 0,
	slowmotion_lby = 0,
 
	slowmotion_new_real = 0,
	slowmotion_new_fake = 0,
	slowmotion_new_lby = 0,
 
	moving_real = 0,
	moving_fake = 0,
	moving_lby = 0,
 
	moving_new_real = 0,
	moving_new_fake = 0,
	moving_new_lby = 0,
 
	inair_real = 0,
	inair_fake = 0,
	inair_lby = 0,
 
	inair_new_real = 0,
	inair_new_fake = 0,
	inair_new_lby = 0
];
 
var condition = 0; // 0 - undefined/global ; 1 - standing ; 2 slow motion ; 3 - moving ; 4 - in air
 
function antiaim_mode(){
 
	var flags = Entity.GetProp(Entity.GetLocalPlayer(), 'CBasePlayer', 'm_fFlags');
	localplayer = Entity.GetLocalPlayer();	
	if (getvelocity(localplayer) >= 5){
		if (UI.GetValue (["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"]) ) {
			if (UI.GetValue(["Rage", "Map1e", "SHEET_MGR", "Map1e", "Enable Slow Motion"])){
				condition = 2;
			}
			else {
				condition = 0;
			}
		}
		else if (UI.GetValue(["Rage", "Map1e", "SHEET_MGR", "Map1e", "Enable Moving"]) && condition != 2){
			condition = 3;
		}
		else{
			condition = 0;
		}
	}
	if (getvelocity(localplayer) < 5){
		if (UI.GetValue(["Rage", "Map1e", "SHEET_MGR", "Map1e", "Enable Standing"])){
			condition = 1;
		}
		else {
			condition = 0;
		}
	}
	if (!(flags & 1 << 0)) {
		if (UI.GetValue(["Rage", "Map1e", "SHEET_MGR", "Map1e", "Enable In Air"])){
			condition = 4;
		}
		else{
			condition = 0;
		}
	}
}
 
function jitter(){
	global_jitter = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Yaw jitter"])
	standing_jitter = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Standing Yaw jitter"])
	slowmotion_jitter = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Yaw jitter"])
	moving_jitter = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Moving Yaw jitter"])
	inair_jitter = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","In Air Yaw jitter"])	
 
	global_jitter_limit = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Jitter limit"])
	standing_jitter_limit = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Standing Jitter limit"])
	slowmotion_jitter_limit = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Jitter limit"])
	moving_jitter_limit = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Moving Jitter limit"])
	inair_jitter_limit = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","In Air Jitter limit"])
 
	if (condition == 0){
		if (global_jitter == 0){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], 0);
			}
		}
		if (global_jitter == 1){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], getRandomInt(-global_jitter_limit/2 , global_jitter_limit/2));
			}
		}
		if (global_jitter == 2){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
				if (side > 1) {
					UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], -global_jitter_limit/2);
				}
				if (side < 1) {
					UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], global_jitter_limit/2);
				}
			}
		}
		if (global_jitter == 3){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "Always")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"] , global_jitter_limit);
			}
		}
	}
	if (condition == 1){
		if (standing_jitter == 0){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], 0);
			}
		}
		if (standing_jitter == 1){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], getRandomInt(-standing_jitter_limit/2 , standing_jitter_limit/2));
			}
		}
		if (standing_jitter == 2){
			UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
			side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
			if (side > 1) {
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], -standing_jitter_limit/2);
			}
			if (side < 1) {
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], standing_jitter_limit/2);
			}
		}
		if (standing_jitter == 3){
			UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "Always")
			UI.SetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"] , standing_jitter_limit);
		}
	}
	if (condition == 2){
		if (slowmotion_jitter == 0){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], 0);
			}
		}
		if (slowmotion_jitter == 1){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], getRandomInt(-slowmotion_jitter_limit/2 , slowmotion_jitter_limit/2));
			}
		}
		if (slowmotion_jitter == 2){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
				if (side > 1) {
					UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], -slowmotion_jitter_limit/2);
				}
				if (side < 1) {
					UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], slowmotion_jitter_limit/2);
				}
			}
		}
		if (slowmotion_jitter == 3){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "Always")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"] , slowmotion_jitter_limit);
			}
		}
	}
	if (condition == 3){
		if (moving_jitter == 0){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], 0);
			}
		}
		if (moving_jitter == 1){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], getRandomInt(-moving_jitter_limit/2 , moving_jitter_limit/2));
			}
		}
		if (moving_jitter == 2){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
				if (side > 1) {
					UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], -moving_jitter_limit/2);
				}
				if (side < 1) {
					UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], moving_jitter_limit/2);
				}
			}
		}
		if (moving_jitter == 3){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "Always")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"] , moving_jitter_limit);
			}
		}
	}
	if (condition == 4){
		if (inair_jitter == 0){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], 0);
			}
		}
		if (inair_jitter == 1){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], getRandomInt(-inair_jitter_limit/2 , inair_jitter_limit/2));
			}
		}
		if (inair_jitter == 2){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "None")
				side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
				if (side > 1) {
					UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], -inair_jitter_limit/2);
				}
				if (side < 1) {
					UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], inair_jitter_limit/2);
				}
			}
		}
		if (inair_jitter == 3){
			if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit AA"])) {
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "Jitter"] , "Always")
				UI.SetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"] , inair_jitter_limit);
			}
		}
	}
}
 
function RADTODEGA(radians){
    return radians * 180 / Math.PI
}
function calcAngle(source,entityPos){
    var delta = []
    delta[0] = source[0] - entityPos[0]
    delta[1] = source[1] - entityPos[1]
    delta[2] = source[2] - entityPos[2]
    var angles = []
    var viewangles = Local.GetViewAngles()
    angles[0] = RADTODEGA(Math.atan(delta[2] / Math.hypot(delta[0], delta[1]))) - viewangles[0]
    angles[1] = RADTODEGA(Math.atan(delta[1] / delta[0])) - viewangles[1]
    angles[2] = 0
    if(delta[0] >= 0)
        angles[1] += 180
 
    return angles
}
var antibf = [
	invert = false
];
var shots = 0
function onBulletImpact(){
    var ent = Entity.GetEntityFromUserID(Event.GetInt("userid"))
    if(ent == Entity.GetLocalPlayer() || Entity.IsTeammate(ent))
        return
    var pos = [Event.GetFloat("x"), Event.GetFloat("y"), Event.GetFloat("z")]
    var ang = calcAngle(Entity.GetEyePosition(ent), pos)
    var angToLocal = calcAngle(Entity.GetEyePosition(ent), Entity.GetHitboxPosition(Entity.GetLocalPlayer(), 0))
    var delta = [angToLocal[0]-ang[0],angToLocal[1]-ang[1],0]
    var FOV = Math.sqrt(delta[0] * delta[0] + delta[1] * delta[1])
    if(FOV < 15){
        shots++
        if(!(shots % 2)) {
			antibf.invert = true;
		}else{
			antibf.invert = false;
		}
	}
}
function playerhurt() {
	if(Entity.GetEntityFromUserID(Event.GetInt("userid")) == Entity.GetLocalPlayer()) {
		antibf.invert = true;
	}
	else {
		antibf.invert = false;
	}
}
 
function setInvert(shouldInvert) {
    if (shouldInvert) {
        if (!UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
            UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
        }
    } else {
        if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
           UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
        }
    }
}
function bodyaw(){
	const enemies = Entity.GetEnemies();
	angles = Local.GetViewAngles();
	right = getWallDistance(Entity.GetLocalPlayer(), [0, angles[1] + 60]);
	left = getWallDistance(Entity.GetLocalPlayer(), [0, angles[1] - 60]);
	front = getWallDistance(Entity.GetLocalPlayer(), [0, angles[1]]);
	diff = Math.abs(left - right);
 
	target = Ragebot.GetTarget();
	global_bodyaw = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Body yaw"])
	standing_bodyaw = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Standing Body yaw"])
	slowmotion_bodyaw = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Body yaw"])
	moving_bodyaw = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Moving Body yaw"])
	inair_bodyaw = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","In Air Body yaw"])
 
	if (UI.GetValue(["Rage", "Map1e", "SHEET_MGR", "Map1e", "Jitter when vulnerable"])){
		if (condition == 0 ){
			 for (var i = 0; i < enemies.length; i++) {
				const ent = enemies[i];
				if (!Entity.IsAlive(ent) || Entity.IsDormant(ent)){
					side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
					if (side > 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
					}
					if (side < 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
					}
				}
			}
		}
	}
	if (UI.GetValue(["Rage", "Map1e", "SHEET_MGR", "Map1e", "Standing Jitter when vulnerable"])){
		if (condition == 1 ){
			for (var i = 0; i < enemies.length; i++) {
				const ent = enemies[i];
				if (!Entity.IsAlive(ent) || Entity.IsDormant(ent)){
					side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
					if (side > 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
					}
					if (side < 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
					}
				}
			}
		}
	}
	if (UI.GetValue(["Rage", "Map1e", "SHEET_MGR", "Map1e", "Slow Motion Jitter when vulnerable"])){
		if (condition == 2 ){
			for (var i = 0; i < enemies.length; i++) {
				const ent = enemies[i];
				if (!Entity.IsAlive(ent) || Entity.IsDormant(ent)){
					side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
					if (side > 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
					}
					if (side < 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
					}
				}
			}
		}
	}
	if (UI.GetValue(["Rage", "Map1e", "SHEET_MGR", "Map1e", "Moving Jitter when vulnerable"])){
		if (condition == 3 ){
			for (var i = 0; i < enemies.length; i++) {
				const ent = enemies[i];
				if (!Entity.IsAlive(ent) || Entity.IsDormant(ent)){
					side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
					if (side > 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
					}
					if (side < 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
					}
				}
			}
		}
	}
	if (UI.GetValue(["Rage", "Map1e", "SHEET_MGR", "Map1e", "In Air Jitter when vulnerable"])){
		if (condition == 4 ){
			for (var i = 0; i < enemies.length; i++) {
				const ent = enemies[i];
				if (!Entity.IsAlive(ent) || Entity.IsDormant(ent)){
					side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
					if (side > 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
					}
					if (side < 1) {
						UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
					}
				}
			}
		}
	}	
 
	if (condition == 0){
		if (global_bodyaw == 0){
 
		}
		if (global_bodyaw == 1){
			if (front < 50) {
				setInvert(right > left);
			}
			else {
				setInvert(right < left);
			}
		}
		if (global_bodyaw == 2){
			if (front < 500) {
                setInvert(right > left);
            }
		}
		if (global_bodyaw == 3){
			if (front < 500) {
                setInvert(right < left);
            }
		}
		if (global_bodyaw == 4){
			side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
			if (side > 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			if (side < 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
		if (global_bodyaw == 5){
			if (antibf.invert == true){
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
	}
	if (condition == 1){
		if (standing_bodyaw == 0){
 
		}
		if (standing_bodyaw == 1){
			if (front < 50) {
				setInvert(right > left);
			}
			else {
				setInvert(right < left);
			}
		}
		if (standing_bodyaw == 2){
			if (front < 500) {
                setInvert(right > left);
            }
		}
		if (standing_bodyaw == 3){
			if (front < 500) {
                setInvert(right < left);
            }
		}
		if (standing_bodyaw == 4){
			side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
			if (side > 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			if (side < 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
		if (standing_bodyaw == 5){
			if (antibf.invert == true){
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
	}
	if (condition == 2){
		if(slowmotion_bodyaw == 0){
 
		}
		if(slowmotion_bodyaw == 1){
			if (front < 50) {
				setInvert(right > left);
			}
			else {
				setInvert(right < left);
			}
		}
		if(slowmotion_bodyaw == 2){
			if (front < 500) {
                setInvert(right > left);
            }
		}
		if(slowmotion_bodyaw == 3){
			if (front < 500) {
                setInvert(right < left);
            }
		}
		if(slowmotion_bodyaw == 4){
			side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
			if (side > 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			if (side < 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
		if(slowmotion_bodyaw == 5){
			if (antibf.invert == true){
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
	}
	if (condition == 3){
		if(moving_bodyaw == 0){
 
		}
		if(moving_bodyaw == 1){
			if (front < 50) {
				setInvert(right > left);
			}
			else {
				setInvert(right < left);
			}
		}
		if(moving_bodyaw == 2){
			if (front < 500) {
                setInvert(right > left);
            }
		}
		if(moving_bodyaw == 3){
			if (front < 500) {
                setInvert(right < left);
            }
		}
		if(moving_bodyaw == 4){
			side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
			if (side > 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			if (side < 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
		if(moving_bodyaw == 5){
			if (antibf.invert == true){
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
	}
	if (condition == 4){
		if(inair_bodyaw == 0){
 
		}
		if(inair_bodyaw == 1){
			if (front < 50) {
				setInvert(right > left);
			}
			else {
				setInvert(right < left);
			}
		}
		if(inair_bodyaw == 2){
			if (front < 500) {
                setInvert(right > left);
            }
		}
		if(inair_bodyaw == 3){
			if (front < 500) {
                setInvert(right < left);
            }
		}
		if(inair_bodyaw == 4){
			side = Math.abs(Math.sin(Globals.Realtime() * 32)) * 2;
			if (side > 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			if (side < 1) {
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
		if(inair_bodyaw == 5){
			if (antibf.invert == true){
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "Always")
			}
			else{
				UI.SetHotkeyState(["Rage", "Anti Aim", "SHEET_MGR", "General", "Key assignment", "AA direction inverter"] , "None")
			}
		}
	}
}
function limitfake(){
	global_limitc = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Randomize limit"])
	standing_limitc = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Standing Randomize limit"])
	slowmotion_limitc = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Randomize limit"])
	moving_limitc = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Moving Randomize limit"])
	inair_limitc = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","In Air Randomize limit"])
 
 
 
	global_limitf = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Fake yaw limit"])
	standing_limitf = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Standing Fake yaw limit"])
	slowmotion_limitf = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Slow Motion Fake yaw limit"])
	moving_limitf = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","Moving Fake yaw limit"])
	inair_limitf = UI.GetValue(["Rage","Map1e","SHEET_MGR","Map1e","In Air Fake yaw limit"])
	if (condition == 0 ){
		if (!UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(global_limitf/1.5);
			AntiAim.SetRealOffset(global_limitf*-1+(getRandomInt(0,global_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
		if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(global_limitf/-1.5);
			AntiAim.SetRealOffset(global_limitf*0.83-(getRandomInt(0,global_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
	}
	if (condition == 1 ){
		if (!UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(standing_limitf/1.5);
			AntiAim.SetRealOffset(standing_limitf*-1+(getRandomInt(0,standing_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
		if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(standing_limitf/-1.5);
			AntiAim.SetRealOffset(standing_limitf*0.83-(getRandomInt(0,standing_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
	}
	if (condition == 2 ){
		if (!UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(slowmotion_limitf/1.5);
			AntiAim.SetRealOffset(slowmotion_limitf*-1+(getRandomInt(0,slowmotion_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
		if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(slowmotion_limitf/-1.5);
			AntiAim.SetRealOffset(slowmotion_limitf*0.83-(getRandomInt(0,slowmotion_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
	}
	if (condition == 3 ){
		if (!UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(moving_limitf/1.5);
			AntiAim.SetRealOffset(moving_limitf*-1+(getRandomInt(0,moving_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
		if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(moving_limitf/-1.5);
			AntiAim.SetRealOffset(moving_limitf*0.83-(getRandomInt(0,moving_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
	}
	if (condition == 4 ){
		if (!UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(inair_limitf/1.5);
			AntiAim.SetRealOffset(inair_limitf*-1+(getRandomInt(0,moving_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
		if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
			AntiAim.SetLBYOffset(inair_limitf/-1.5);
			AntiAim.SetRealOffset(inair_limitf*0.83-(getRandomInt(0,inair_limitc)));
			AntiAim.SetFakeOffset(0);
			AntiAim.SetOverride(1);
		}
	}
}
function reset(){
	AntiAim.SetOverride(0);
	Exploit.EnableRecharge();
}
 
const setvalaa1 = function(name, value){
    return UI.SetValue(["Rage", "Anti Aim", "General", name], value);
}
 
const getvalaa1 = function(name){
    return UI.GetValue(["Rage", "Anti Aim", "General", name]);
}
 
const setvalaa2 = function(name, value){
    return UI.SetValue(["Rage", "Anti Aim", "Directions", name], value);
}
const getvalaa2 = function(name){
    return UI.GetValue(["Rage", "Anti Aim", "Directions", name]);
}
 
const keybind = UI.AddHotkey(["Rage", "Anti Aim", "General", "Key assignment"], "Legit AA", "Legit AA")
const legitaa_time = Global.Realtime();
var E = true;
var Defuse = false;
var x = 1;
var key = 0;
var distance = 0;
var distance1 = 0;
var original_aa = true;
function on_E(){
    var buttons = UserCMD.GetButtons();
    if(UI.GetValue(keybind)) {
 
        if (original_aa)
        {
            restrictions_cache = UI.GetValue(["Config", "Cheat", "General", "Restrictions"]);
            yaw_offset_cache = getvalaa2("Yaw offset");
            jitter_offset_cache = getvalaa2("Jitter offset");
			setvalaa1("Pitch mode", 1);
            at_tar = getvalaa2("At targets");
            autodir = getvalaa2("Auto direction");
            original_aa = false;
        }
        UI.SetValue(["Config", "Cheat", "General", "Restrictions"], 0);
        setvalaa2("Yaw offset", 180);
        setvalaa2("Jitter offset", 0);
        setvalaa1("Pitch mode", 0);
        setvalaa2("At targets", 0);
        setvalaa2("Auto direction", 0);
 
        if (Input.IsKeyPressed(0x45) == true ){
            E = false;
            if(Globals.Realtime() > legitaa_time + 0.2){
                if(E == false){
                    Cheat.ExecuteCommand("+use");
                    E = true;
                }
                if(E == true){
                    Cheat.ExecuteCommand("-use");
                }
            }
        }else{
            if(E == true){
                Cheat.ExecuteCommand("-use");
                E = false;
            }
        }
    }else{
        if (!original_aa){
            UI.SetValue(["Config", "Cheat", "General", "Restrictions"], restrictions_cache);
            setvalaa2("Yaw offset", yaw_offset_cache);
            setvalaa2("Jitter offset", jitter_offset_cache);
            setvalaa1("Pitch mode", 1);
            setvalaa2("At targets", at_tar);
            setvalaa2("Auto direction", autodir);
            original_aa = true;
        }
        legitaa_time = Global.Realtime();
    }
}
function Bomb(){
    var buttons = UserCMD.GetButtons();
    var C4 = Entity.GetEntitiesByClassID(129)[0];
    var Host = Entity.GetEntitiesByClassID(97)[0];
    if (C4){
        var C4Loc = Entity.GetRenderOrigin(C4);
        var local = Entity.GetLocalPlayer();
        var lLoc = Entity.GetRenderOrigin(local)
        distance = calcDist(C4Loc, lLoc);
        //Cheat.Print(distance +"\n");
        if(distance >= 100){
            on_E()
        }
    }else if(Host != undefined){
        var HLoc = Entity.GetRenderOrigin(Host);
        var local = Entity.GetLocalPlayer();
        var lLoc = Entity.GetRenderOrigin(local)
        distance1 = calcDist(HLoc, lLoc);
        //Cheat.Print(distance1 +"\n");
        if(distance1 >= 100){
            on_E()
        }
    }else{
        on_E()
    }
}
function calcDist(local, target) {
    var lx = local[0];
    var ly = local[1];
    var lz = local[2];
    var tx = target[0];
    var ty = target[1];
    var tz = target[2];
    var dx = lx - tx;
    var dy = ly - ty;
    var dz = lz - tz;
    return Math.sqrt(dx * dx + dy * dy + dz * dz);
}
Cheat.RegisterCallback("Unload", "reset")
Cheat.RegisterCallback("Draw", "menu")
Cheat.RegisterCallback("CreateMove","Bomb");
Cheat.RegisterCallback("CreateMove", "jitter")
Cheat.RegisterCallback("CreateMove", "antiaim_mode")
Cheat.RegisterCallback("CreateMove", "bodyaw")
Cheat.RegisterCallback("CreateMove", "limitfake")
Cheat.RegisterCallback("player_hurt", "playerhurt")
Cheat.RegisterCallback("bullet_impact", "onBulletImpact")



duck = 0.70
stand = 0.21
UI.AddHotkey(["Config", "SUBTAB_MGR", "Scripts", "SHEET_MGR", "Keys", "JS Keybinds"], "Fake Duck", "");
var crouchHeight;

function FakeDuck() {
    var cmd = UserCMD.GetButtons();
    //If key is held do ducking
    if(UI.GetValue(["Config", "SUBTAB_MGR", "Scripts", "SHEET_MGR", "Keys", "JS Keybinds", "Fake Duck"])) {
        var entityStuff = Entity.GetProp(Entity.GetLocalPlayer(), "CCSPlayer", "m_flDuckAmount");
        if(UserCMD.Choke(), entityStuff <= stand) {
            crouchHeight = !0
        }
        if(entityStuff >= duck && (crouchHeight = !1, UserCMD.Send()), crouchHeight) {
            UserCMD.SetButtons(4 | cmd)
        } else UserCMD.SetButtons(cmd | 1 << 22)
    } else {
        UserCMD.SetButtons(cmd | 1 << 22)
    }
}
function DrawThread()
{
    var customFont =  Render.GetFont( "comicbd.ttf", 30, true)

    if(UI.GetValue(["Config", "SUBTAB_MGR", "Scripts", "SHEET_MGR", "Keys", "JS Keybinds", "Fake Duck"]))
        {
            //Renders "DUCK" if we are pressing Key
            Render.String(10, 720 / 2 + 358, 0, "DUCK", [255, 255, 255, 255], customFont);
        }
}
Cheat.RegisterCallback("CreateMove", "FakeDuck");

Cheat.RegisterCallback("Draw", "DrawThread");

function AnimationBreak() {
    UI.SetValue( ["Misc.","Movement","Movement","Leg movement"], randomNum(1,2) )
}
Cheat.RegisterCallback("CreateMove", "AnimationBreak")