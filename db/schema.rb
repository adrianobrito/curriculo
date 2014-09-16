# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140916201528) do

  create_table "atividades", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "info_profissional_id"
  end

  create_table "cursos", force: true do |t|
    t.string   "descricao"
    t.string   "instituicao"
    t.date     "inicio"
    t.date     "fim"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cv_id"
  end

  create_table "cvs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "info_academicas", force: true do |t|
    t.integer  "nivel"
    t.string   "curso"
    t.boolean  "incompleto"
    t.string   "instituicao"
    t.date     "inicio"
    t.date     "fim"
    t.integer  "cv_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "info_pessoals", force: true do |t|
    t.string   "cpf"
    t.string   "nome"
    t.string   "nacionalidade"
    t.integer  "estadoCivil"
    t.string   "endereco"
    t.string   "numeroEndereco"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "telefone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cv_id"
  end

  create_table "info_profissionais", force: true do |t|
    t.date     "inicio"
    t.date     "fim"
    t.string   "empresa"
    t.string   "cargo"
    t.integer  "cv_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "info_usuarios", force: true do |t|
    t.string   "email"
    t.string   "senha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cv_id"
    t.string   "login"
  end

end
