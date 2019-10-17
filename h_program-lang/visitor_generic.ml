(* Yoann Padioleau
 *
 * Copyright (C) 2019 r2c
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * version 2.1 as published by the Free Software Foundation, with the
 * special exception on linking described in file license.txt.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the file
 * license.txt for more details.
 *)
open Ocaml
open Ast_generic

(*****************************************************************************)
(* Prelude *)
(*****************************************************************************)

(* hooks *)
type visitor_in = {
  kexpr: (expr  -> unit) * visitor_out -> expr  -> unit;
  kstmt: (stmt  -> unit) * visitor_out -> stmt  -> unit;
  ktype_: (type_  -> unit) * visitor_out -> type_  -> unit;
  kpattern: (pattern  -> unit) * visitor_out -> pattern  -> unit;

  kdef: (def  -> unit) * visitor_out -> def  -> unit;
  kdir: (directive  -> unit) * visitor_out -> directive  -> unit;
  kitem: (item  -> unit) * visitor_out -> item  -> unit;

  kattr: (attribute  -> unit) * visitor_out -> attribute  -> unit;
  kparam: (parameter  -> unit) * visitor_out -> parameter  -> unit;

  kinfo: (tok -> unit)  * visitor_out -> tok  -> unit;
}
and visitor_out = any -> unit

let default_visitor =
  { kexpr   = (fun (k,_) x -> k x);
    kstmt   = (fun (k,_) x -> k x);
    ktype_   = (fun (k,_) x -> k x);
    kpattern   = (fun (k,_) x -> k x);

    kdef   = (fun (k,_) x -> k x);
    kdir   = (fun (k,_) x -> k x);
    kitem   = (fun (k,_) x -> k x);

    kattr   = (fun (k,_) x -> k x);
    kparam   = (fun (k,_) x -> k x);

    kinfo   = (fun (k,_) x -> k x);
  }

let (mk_visitor: visitor_in -> visitor_out) = fun vin ->

(* start of auto generation *)


(* generated by ocamltarzan with: camlp4o -o /tmp/yyy.ml -I pa/ pa_type_conv.cmo pa_visitor.cmo  pr_o.cmo /tmp/xxx.ml  *)

let rec v_info x =
  let k x = match x with { Parse_info.
     token = _v_pinfox; transfo = _v_transfo
    } ->
(*
    let arg = Parse_info.v_pinfo v_pinfox in
    let arg = v_unit v_comments in
    let arg = Parse_info.v_transformation v_transfo in
*)
    ()
  in
  vin.kinfo (k, all_functions) x

and v_tok v = v_info v

and v_wrap: 'a. ('a -> unit) -> 'a wrap -> unit = fun _of_a (v1, v2) ->
  let v1 = _of_a v1 and v2 = v_info v2 in ()

and v_name v = v_wrap v_string v

and v_dotted_name v = v_list v_name v

and v_qualified_name v = v_dotted_name v

and v_module_name =
  function
  | FileName v1 -> let v1 = v_wrap v_string v1 in ()
  | DottedName v1 -> let v1 = v_dotted_name v1 in ()


and v_resolved_name =
  function
  | Local -> ()
  | Param -> ()
  | Global v1 -> let v1 = v_qualified_name v1 in ()
  | NotResolved -> ()
  | Macro -> ()
  | EnumConstant -> ()
  | ImportedModule -> ()

and v_expr x =
  let k x = 
  match x with
  | L v1 -> let v1 = v_literal v1 in ()
  | Container ((v1, v2)) ->
      let v1 = v_container_operator v1 and v2 = v_list v_expr v2 in ()
  | Tuple v1 -> let v1 = v_list v_expr v1 in ()
  | Record v1 -> let v1 = v_list v_field v1 in ()
  | Constructor ((v1, v2)) ->
      let v1 = v_name v1 and v2 = v_list v_expr v2 in ()
  | Lambda ((v1, v2)) -> let v1 = v_parameters v1 and v2 = v_stmt v2 in ()
  | Nop -> ()
  | Id ((v1, v2)) -> let v1 = v_name v1 and v2 = v_id_info v2 in ()
  | IdSpecial v1 -> let v1 = v_special v1 in ()
  | Call ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_arguments v2 in ()
  | Assign ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_expr v2 in ()
  | AssignOp ((v1, v2, v3)) ->
      let v1 = v_expr v1
      and v2 = v_arithmetic_operator v2
      and v3 = v_expr v3
      in ()
  | LetPattern ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_expr v2 in ()
  | ObjAccess ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_name v2 in ()
  | ArrayAccess ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_expr v2 in ()
  | Conditional ((v1, v2, v3)) ->
      let v1 = v_expr v1 and v2 = v_expr v2 and v3 = v_expr v3 in ()
  | MatchPattern ((v1, v2)) ->
      let v1 = v_expr v1
      and v2 =
        v_list
          (fun (v1, v2) -> let v1 = v_pattern v1 and v2 = v_expr v2 in ()) v2
      in ()
  | Yield v1 -> let v1 = v_expr v1 in ()
  | Cast ((v1, v2)) -> let v1 = v_type_ v1 and v2 = v_expr v2 in ()
  | Seq v1 -> let v1 = v_list v_expr v1 in ()
  | Ref v1 -> let v1 = v_expr v1 in ()
  | DeRef v1 -> let v1 = v_expr v1 in ()
  | OtherExpr ((v1, v2)) ->
      let v1 = v_other_expr_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kexpr (k, all_functions) x


and v_literal =
  function
  | Unit v1 -> let v1 = v_tok v1 in ()
  | Bool v1 -> let v1 = v_wrap v_bool v1 in ()
  | Int v1 -> let v1 = v_wrap v_string v1 in ()
  | Float v1 -> let v1 = v_wrap v_string v1 in ()
  | Char v1 -> let v1 = v_wrap v_string v1 in ()
  | String v1 -> let v1 = v_wrap v_string v1 in ()
  | Regexp v1 -> let v1 = v_wrap v_string v1 in ()
  | Null v1 -> let v1 = v_tok v1 in ()
  | Undefined v1 -> let v1 = v_tok v1 in ()

and v_container_operator =
  function | Array -> () | List -> () | Set -> () | Dict -> ()
and
  v_id_info {
              id_qualifier = v_id_qualifier;
              id_typeargs = v_id_typeargs;
              id_resolved = v_id_resolved;
              id_type = v_id_type
            } =
  let arg = v_option v_dotted_name v_id_qualifier in
  let arg = v_option v_type_arguments v_id_typeargs in
  let arg = v_ref v_resolved_name v_id_resolved in
  let arg = v_ref (v_option v_type_) v_id_type in ()
and v_special =
  function
  | This -> ()
  | Super -> ()
  | Self -> ()
  | Parent -> ()
  | Eval -> ()
  | Typeof -> ()
  | Instanceof -> ()
  | New -> ()
  | Concat -> ()
  | Spread -> ()
  | ArithOp v1 -> let v1 = v_arithmetic_operator v1 in ()
  | IncrDecr ((v1, v2)) -> let v1 = v_bool v1 and v2 = v_bool v2 in ()
and v_arithmetic_operator =
  function
  | Plus -> ()
  | Minus -> ()
  | Mult -> ()
  | Div -> ()
  | Mod -> ()
  | Pow -> ()
  | FloorDiv -> ()
  | LSL -> ()
  | LSR -> ()
  | ASR -> ()
  | BitOr -> ()
  | BitXor -> ()
  | BitAnd -> ()
  | BitNot -> ()
  | And -> ()
  | Or -> ()
  | Not -> ()
  | Eq -> ()
  | NotEq -> ()
  | PhysEq -> ()
  | NotPhysEq -> ()
  | Lt -> ()
  | LtE -> ()
  | Gt -> ()
  | GtE -> ()
and v_arguments v = v_list v_argument v
and v_argument =
  function
  | Arg v1 -> let v1 = v_expr v1 in ()
  | ArgKwd ((v1, v2)) -> let v1 = v_name v1 and v2 = v_expr v2 in ()
  | ArgOther ((v1, v2)) ->
      let v1 = v_other_argument_operator v1 and v2 = v_list v_any v2 in ()
and v_other_argument_operator = function | OA_ArgPow -> ()
and v_other_expr_operator =
  function
  | OE_Exports -> ()
  | OE_Module -> ()
  | OE_Define -> ()
  | OE_Arguments -> ()
  | OE_NewTarget -> ()
  | OE_Delete -> ()
  | OE_YieldStar -> ()
  | OE_Await -> ()
  | OE_Require -> ()
  | OE_UseStrict -> ()
  | OE_ObjAccess_PN_Computed -> ()
  | OE_ExprClass -> ()
  | OE_Imag -> ()
  | OE_Is -> ()
  | OE_IsNot -> ()
  | OE_In -> ()
  | OE_NotIn -> ()
  | OE_Invert -> ()
  | OE_Ellipsis -> ()
  | OE_Slice -> ()
  | OE_ExtSlice -> ()
  | OE_ListComp -> ()
  | OE_GeneratorExpr -> ()
  | OE_Repr -> ()
  | OE_NameOrClassType -> ()
  | OE_ClassLiteral -> ()
  | OE_RecordPtAccess -> ()
  | OE_SizeOf -> ()
  | OE_ArrayInitDesignator -> ()
  | OE_GccConstructor -> ()
  | OE_Unpack -> ()
and v_type_ x =
  let k x = 
  match x with
  | TyBuiltin v1 -> let v1 = v_wrap v_string v1 in ()
  | TyFun ((v1, v2)) -> let v1 = v_list v_type_ v1 and v2 = v_type_ v2 in ()
  | TyApply ((v1, v2)) ->
      let v1 = v_name v1 and v2 = v_type_arguments v2 in ()
  | TyVar v1 -> let v1 = v_name v1 in ()
  | TyArray ((v1, v2)) ->
      let v1 = v_option v_expr v1 and v2 = v_type_ v2 in ()
  | TyPointer v1 -> let v1 = v_type_ v1 in ()
  | TyTuple v1 -> let v1 = v_list v_type_ v1 in ()
  | TyQuestion v1 -> let v1 = v_type_ v1 in ()
  | OtherType ((v1, v2)) ->
      let v1 = v_other_type_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.ktype_ (k, all_functions) x

and v_type_arguments v = v_list v_type_argument v
and v_type_argument =
  function
  | TypeArg v1 -> let v1 = v_type_ v1 in ()
  | OtherTypeArg ((v1, v2)) ->
      let v1 = v_other_type_argument_operator v1
      and v2 = v_list v_any v2
      in ()
and v_other_type_argument_operator = function | OTA_Question -> ()
and v_other_type_operator =
  function
  | OT_Expr -> ()
  | OT_StructName -> ()
  | OT_UnionName -> ()
  | OT_EnumName -> ()
  | OT_Shape -> ()
  | OT_Variadic -> ()
and v_type_parameter (v1, v2) =
  let v1 = v_name v1 and v2 = v_type_parameter_constraints v2 in ()
and v_type_parameter_constraints v = v_list v_type_parameter_constraint v
and v_type_parameter_constraint =
  function | Extends v1 -> let v1 = v_type_ v1 in ()
and v_attribute x =
  let k x = 
  match x with
  | Static -> ()
  | Volatile -> ()
  | Extern -> ()
  | Public -> ()
  | Private -> ()
  | Protected -> ()
  | Abstract -> ()
  | Final -> ()
  | Var -> ()
  | Let -> ()
  | Const -> ()
  | Generator -> ()
  | Async -> ()
  | Ctor -> ()
  | Dtor -> ()
  | Getter -> ()
  | Setter -> ()
  | Variadic -> ()
  | NamedAttr ((v1, v2)) -> let v1 = v_name v1 and v2 = v_list v_any v2 in ()
  | OtherAttribute ((v1, v2)) ->
      let v1 = v_other_attribute_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kattr (k, all_functions) x

and v_other_attribute_operator =
  function
  | OA_StrictFP -> ()
  | OA_Transient -> ()
  | OA_Synchronized -> ()
  | OA_Native -> ()
  | OA_AnnotJavaOther v1 -> let v1 = v_string v1 in ()
  | OA_AnnotThrow -> ()
  | OA_Expr -> ()
and v_stmt x =
  let k x =
  match x with
  | ExprStmt v1 -> let v1 = v_expr v1 in ()
  | LocalDef v1 -> let v1 = v_def v1 in ()
  | LocalDirective v1 -> let v1 = v_directive v1 in ()
  | Block v1 -> let v1 = v_list v_stmt v1 in ()
  | If ((v1, v2, v3)) ->
      let v1 = v_expr v1 and v2 = v_stmt v2 and v3 = v_stmt v3 in ()
  | While ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_stmt v2 in ()
  | DoWhile ((v1, v2)) -> let v1 = v_stmt v1 and v2 = v_expr v2 in ()
  | For ((v1, v2)) -> let v1 = v_for_header v1 and v2 = v_stmt v2 in ()
  | Switch ((v1, v2)) ->
      let v1 = v_expr v1
      and v2 =
        v_list
          (fun (v1, v2) -> let v1 = v_list v_case v1 and v2 = v_stmt v2 in ())
          v2
      in ()
  | Return v1 -> let v1 = v_expr v1 in ()
  | Continue v1 -> let v1 = v_option v_expr v1 in ()
  | Break v1 -> let v1 = v_option v_expr v1 in ()
  | Label ((v1, v2)) -> let v1 = v_label v1 and v2 = v_stmt v2 in ()
  | Goto v1 -> let v1 = v_label v1 in ()
  | Throw v1 -> let v1 = v_expr v1 in ()
  | Try ((v1, v2, v3)) ->
      let v1 = v_stmt v1
      and v2 = v_list v_catch v2
      and v3 = v_option v_finally v3
      in ()
  | Assert ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_option v_expr v2 in ()
  | OtherStmt ((v1, v2)) ->
      let v1 = v_other_stmt_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kstmt (k, all_functions) x

and v_case = function | Case v1 -> let v1 = v_expr v1 in () | Default -> ()
and v_catch (v1, v2) = let v1 = v_pattern v1 and v2 = v_stmt v2 in ()
and v_finally v = v_stmt v
and v_label v = v_name v
and v_for_header =
  function
  | ForClassic ((v1, v2, v3)) ->
      let v1 = v_expr v1 and v2 = v_expr v2 and v3 = v_expr v3 in ()
  | ForEach ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_expr v2 in ()
and v_other_stmt_operator =
  function
  | OS_Delete -> ()
  | OS_Print -> ()
  | OS_ForOrElse -> ()
  | OS_WhileOrElse -> ()
  | OS_TryOrElse -> ()
  | OS_With -> ()
  | OS_ThrowMulti -> ()
  | OS_Global -> ()
  | OS_Pass -> ()
  | OS_Sync -> ()
  | OS_Asm -> ()
and v_pattern x =
  let k x = 
  match x with
  | PatVar v1 -> let v1 = v_name v1 in ()
  | PatLiteral v1 -> let v1 = v_literal v1 in ()
  | PatConstructor ((v1, v2)) ->
      let v1 = v_name v1 and v2 = v_list v_pattern v2 in ()
  | PatTuple v1 -> let v1 = v_list v_pattern v1 in ()
  | PatList v1 -> let v1 = v_list v_pattern v1 in ()
  | PatKeyVal ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_pattern v2 in ()
  | PatUnderscore v1 -> let v1 = v_tok v1 in ()
  | PatDisj ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_pattern v2 in ()
  | PatTyped ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_type_ v2 in ()
  | OtherPat ((v1, v2)) ->
      let v1 = v_other_pattern_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kpattern (k, all_functions) x
and v_other_pattern_operator = function | OP_Expr -> ()
and v_def x =
  let k x =
  match x with
  | FuncDef v1 -> let v1 = v_function_definition v1 in ()
  | VarDef v1 -> let v1 = v_variable_definition v1 in ()
  | ClassDef v1 -> let v1 = v_class_definition v1 in ()
  | TypeDef v1 -> let v1 = v_type_definition v1 in ()
  in
  vin.kdef (k, all_functions) x
and
  v_function_definition {
                          fname = v_fname;
                          fparams = v_fparams;
                          frettype = v_frettype;
                          fbody = v_fbody;
                          fattrs = v_fattrs
                        } =
  let arg = v_name v_fname in
  let arg = v_parameters v_fparams in
  let arg = v_option v_type_ v_frettype in
  let arg = v_stmt v_fbody in let arg = v_list v_attribute v_fattrs in ()
and v_parameters v = v_list v_parameter v
and v_parameter x =
  let k x =
  match x with
  | ParamClassic v1 -> let v1 = v_parameter_classic v1 in ()
  | ParamPattern v1 -> let v1 = v_pattern v1 in ()
  | OtherParam ((v1, v2)) ->
      let v1 = v_other_parameter_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kparam (k, all_functions) x
and
  v_parameter_classic {
                        pname = v_pname;
                        pdefault = v_pdefault;
                        ptype = v_ptype;
                        pattrs = v_pattrs
                      } =
  let arg = v_name v_pname in
  let arg = v_option v_expr v_pdefault in
  let arg = v_option v_type_ v_ptype in
  let arg = v_list v_attribute v_pattrs in ()
and v_other_parameter_operator =
  function | OPO_KwdParam -> () | OPO_Ref -> ()
and
  v_variable_definition {
                          vname = v_vname;
                          vinit = v_vinit;
                          vtype = v_vtype;
                          vattrs = v_vattrs
                        } =
  let arg = v_name v_vname in
  let arg = v_option v_expr v_vinit in
  let arg = v_option v_type_ v_vtype in
  let arg = v_list v_attribute v_vattrs in ()
and v_field =
  function
  | FieldVar v1 -> let v1 = v_variable_definition v1 in ()
  | FieldMethod v1 -> let v1 = v_function_definition v1 in ()
  | FieldDynamic ((v1, v2, v3)) ->
      let v1 = v_expr v1
      and v2 = v_list v_attribute v2
      and v3 = v_expr v3
      in ()
  | FieldSpread v1 -> let v1 = v_expr v1 in ()
  | FieldStmt v1 -> let v1 = v_stmt v1 in ()
and
  v_type_definition {
                      ttname = v_ttname;
                      tbody = v_tbody;
                      tattrs = v_tattrs;
                      tother = v_tother
                    } =
  let arg = v_name v_ttname in
  let arg = v_type_definition_kind v_tbody in
  let arg = v_list v_attribute v_tattrs in
  let arg = v_other_type_definition_operator v_tother in ()
and v_type_definition_kind =
  function
  | OrType v1 ->
      let v1 =
        v_list
          (fun (v1, v2) ->
             let v1 = v_name v1 and v2 = v_list v_type_ v2 in ())
          v1
      in ()
  | AndType v1 -> let v1 = v_list v_field v1 in ()
  | AliasType v1 -> let v1 = v_type_ v1 in ()
  | OtherTypeKind ((v1, v2)) ->
      let v1 = v_other_type_kind_operator v1 and v2 = v_list v_any v2 in ()
and v_other_type_kind_operator = function | OTKO_EnumWithValue -> ()
and v_other_type_definition_operator =
  function | OTDO_Struct -> () | OTDO_Union -> () | OTDO_Enum -> ()
and
  v_class_definition {
                       cname = v_cname;
                       ckind = v_ckind;
                       cextends = v_cextends;
                       cimplements = v_cimplements;
                       cbody = v_cbody;
                       cattrs = v_cattrs
                     } =
  let arg = v_name v_cname in
  let arg = v_class_kind v_ckind in
  let arg = v_list v_type_ v_cextends in
  let arg = v_list v_type_ v_cimplements in
  let arg = v_list v_field v_cbody in
  let arg = v_list v_attribute v_cattrs in ()
and v_class_kind = function | Class -> () | Interface -> () | Trait -> ()
and v_directive x =
  let k x = 
  match x with
  | Import ((v1, v2)) ->
      let v1 = v_module_name v1 and v2 = v_list v_alias v2 in ()
  | ImportAll ((v1, v2)) ->
      let v1 = v_module_name v1 and v2 = v_option v_name v2 in ()
  | OtherDirective ((v1, v2)) ->
      let v1 = v_other_directive_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kdir (k, all_functions) x
and v_alias (v1, v2) = let v1 = v_name v1 and v2 = v_option v_name v2 in ()
and v_other_directive_operator =
  function
  | OI_Export -> ()
  | OI_ImportCss -> ()
  | OI_ImportEffect -> ()
  | OI_Package -> ()
  | OI_Define -> ()
  | OI_Macro -> ()
  | OI_Prototype -> ()
  | OI_Namespace -> ()
and v_item x =
  let k x = 
  match x with
  | IStmt v1 -> let v1 = v_stmt v1 in ()
  | IDef v1 -> let v1 = v_def v1 in ()
  | IDir v1 -> let v1 = v_directive v1 in ()
  in
  vin.kitem (k, all_functions) x
and v_program v = v_list v_item v
and v_any =
  function
  | N v1 -> let v1 = v_name v1 in ()
  | E v1 -> let v1 = v_expr v1 in ()
  | S v1 -> let v1 = v_stmt v1 in ()
  | T v1 -> let v1 = v_type_ v1 in ()
  | P v1 -> let v1 = v_pattern v1 in ()
  | D v1 -> let v1 = v_def v1 in ()
  | Di v1 -> let v1 = v_directive v1 in ()
  | I v1 -> let v1 = v_item v1 in ()
  | Pa v1 -> let v1 = v_parameter v1 in ()
  | A v1 -> let v1 = v_attribute v1 in ()
  | Pr v1 -> let v1 = v_program v1 in ()
  
and all_functions x = v_any x
in
all_functions

(*****************************************************************************)
(* Helpers *)
(*****************************************************************************)
