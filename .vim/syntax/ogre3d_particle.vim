" {{{ File header
 " vim:ff=unix ts=4 ss=4
 " vim60:fdm=marker
 "
 " \file        ogreparticle.vim
 " \date        Tue Aug 11 16:39:49 BST 2009
 "
 " \brief    "Language: Ogre(3d)'s .particle
 " \note        Based on TextPad syntax definitions for Ogre3D .particle files Copyright (C) 2004, Harrison Ulrich
 "
 " \author    "Maintainer: <robin@red-redemption.com> (lokidokicoki)
 " \note        Also based on Feral's .material and .overlay highlight scripts
 " }}}
 
 " For version 5.x: Clear all syntax items
 " For version 6.x: Quit when a syntax file was already loaded
 if version < 600
     syntax clear
 elseif exists("b:current_syntax")
     finish
 endif
 
 "syn case match
 
 ";code blocks
 syntax keyword ogreparticle_code_blocks    particle_system emitter affector
 
 ";variables
 syntax keyword ogreparticle_variables    quota material particle_width particle_height cull_each billboard_type billboard_origin   billboard_rotation_type common_direction common_up_vector renderer sorted local_space point_rendering accurate_facing iteration_interval nonvisible_update_timeout
 syntax keyword ogreparticle_variables   angle colour colour_range_start colour_range_end direction emission_rate position velocity velocity_min velocity_max time_to_live time_to_live_min time_to_live_max duration duration_min duration_max repeat_delay repeat_delay_min repeat_delay_max
 syntax keyword ogreparticle_variables    Point Box Cylinder Ellipsoid Hollow Ellipsoid Ring width height depth inner_width inner_height inner_depth emit_emitter_quota name emit_emitter
 syntax keyword ogreparticle_variables    LinearForce ColourFader ColourFader2 Scaler Rotator ColourInterpolator ColourImage DeflectorPlane DirectionRandomiser
 syntax keyword ogreparticle_variables    force_vector force_application red green blue alpha red1 green1 blue1 alpha1 red2 green2 blue2 alpha2 state_change rate rotation_speed_range_start rotation_speed_range_end rotation_range_start rotation_range_end time0 colour0 time1 colour1 time2 colour2 
 syntax keyword ogreparticle_variables    plane_point plane_normal bounce randomness scope keep_velocity time3 time4 time5 colour3 colour4 colour5 image 
 ";values
 syntax keyword ogreparticle_values  add billboard true false none point oriented_common oriented_self perpendicular_common perpendicular_self top_left top_center top_right center_left center center_right bottom_left bottom_center bottom_right vertex texcoord on off average 
 " integer number
 syn match ogreparticle_Number        display "\<[0-9]\+\>"
 
 " floating point number, with dot, optional exponent
 syn match ogreparticle_Float        "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\>"
 " floating point number, starting with a dot, optional exponent
 syn match ogreparticle_Float        "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\>"
 "" floating point number, without dot, with exponent
 "syn match ogreparticle_Float        "\<[0-9]\+e[-+]\=[0-9]\+\>"
 
 syn match  ogreparticle_comment    "//.*"
 
 "material Examples/OgreLogo
 syn match ogreparticle_MaterialName    display "\(\<material\>\s\{-}\)\@<=\<\f*\>"
 
 "particle_system Examples/OgreLogo
 syn match ogreparticle_ParticleName    display "\(\<particle_system\>\s\{-}\)\@<=\<\f*\>"
 
 "image trimid.png
 syn match ogreparticle_ImageName    display "\(\<image\>\s\{-}\)\@<=\<\f\{-}\.\f\{-}\>"
 
 " operators:
 syn match    ogreparticle_Brace        "[{}]"
 
 "syncing method
 "syn sync minlines=100
 
 " Define the default highlighting.
 " For version 5.7 and earlier: only when not done already
 " For version 5.8 and later: only when an item doesn't have highlighting yet
 if version >= 508 || !exists("did_ogre3d_particle_syntax_inits")
     if version < 508
         let did_ogre3d_particle_syntax_inits = 1
         command -nargs=+ HiLink hi link <args>
     else
         command -nargs=+ HiLink hi def link <args>
     endif
 
     HiLink ogreparticle_ParticleName    Function
 
     HiLink ogreparticle_MaterialName    String
     HiLink ogreparticle_FileName        String
     HiLink ogreparticle_Number        Number
     HiLink ogreparticle_Float        Float
 
 "    HiLink ogreparticle_Brace    Operator
     hi ogreparticle_Brace    guifg=coral
 
     HiLink ogreparticle_code_blocks    Structure
     HiLink ogreparticle_variables    Statement
     HiLink ogreparticle_values    Float
      HiLink ogreparticle_comment    Comment
 
     delcommand HiLink
 endif
 
 let b:current_syntax = "ogre3d_particle"
 "
 "EOF
